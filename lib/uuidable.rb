# Extend ActiveRecord::Base with this module and all UUID columns will be automatically handled as though they
# are stored as BINARY(16) in the database but accessible as their string representations from code.
module Uuidable
  def self.extended(base)
    base.class_eval do
      include InstanceMethods

      delegate :uuid_binary_to_string, :uuid_string_to_binary, :to => 'self.class'
      private :uuid_binary_to_string, :uuid_string_to_binary

      class << self
        # The overriding of the query conditions handling code to trap UUID columns needs to be done with
        # alias_method_chain as the original methods are defined in the class, and this module gets put
        # into the hierarchy *above* that (so never overrides it).
        alias_method_chain(:sanitize_sql_hash_for_assignment, :uuids)
        alias_method_chain(:sanitize_sql_for_conditions, :uuids)
        alias_method(:sanitize_sql, :sanitize_sql_for_conditions)
      end
    end
  end

  module InstanceMethods
    def self.included(base)
      base.class_eval do
        delegate :map_uuid_field_values_to_uuid, :to => 'self.class'
        alias_method_chain(:quote_columns, :uuids)
      end
    end

    def quote_columns_with_uuids(quoter, hash)
      map_uuid_field_values_to_uuid(hash)
      quote_columns_without_uuids(quoter, hash)
    end
    private :quote_columns_with_uuids
  end

  UUID_COLUMN_REGEXP = /^(.+_)?uuid$/

  def uuid_attribute?(attr_name)
    attr_name.to_s =~ UUID_COLUMN_REGEXP
  end
  private :uuid_attribute?

  # Override the default ActiveRecord behaviour for read attribute method definitions so that UUID columns are
  # automatically overridden so that they decode the BINARY(16) representation.
  def define_read_method(symbol, attr_name, column)
    super
    class_eval(%Q{def #{symbol} ; self[#{attr_name.to_sym.inspect}].to_uuid_as_string ; end}) if uuid_attribute?(attr_name)
  end

  # Override the default ActiveRecord behaviour for write attribute method definitions so that UUID columns are
  # automatically overridden so that they encode to the BINARY(16) representation.
  def define_write_method(attr_name)
    super
    class_eval(%Q{def #{attr_name}=(value) ; self[#{attr_name.to_sym.inspect}] = value.to_uuid ; end}) if uuid_attribute?(attr_name)
  end

  # Override the default ActiveRecord behaviour for query conditions sanitization so that UUID fields are 
  # automatically converted to their binary representation.
  def sanitize_sql_for_conditions_with_uuids(condition, table_name = quoted_table_name)
    map_uuid_field_values_to_uuid(condition) if condition.is_a?(Hash)
    sanitize_sql_for_conditions_without_uuids(condition, table_name)
  end
  protected :sanitize_sql_for_conditions_with_uuids

  # Override the default ActiveRecord behaviour for inserts so that UUID fields are automatically converted
  # to their binary representation.
  def sanitize_sql_hash_for_assignment_with_uuids(attrs)
    map_uuid_field_values_to_uuid(attrs)
    sanitize_sql_hash_for_assignment_without_uuids(attrs)
  end
  protected :sanitize_sql_hash_for_assignment_with_uuids

  def map_uuid_field_values_to_uuid(conditions)
    conditions.each do |key, value|
      case
      when key.is_a?(Hash)                            then map_uuid_field_values_to_uuid(value)
      when uuid_attribute?(key) && value.is_a?(Array) then conditions[key] = value.map(&:to_uuid)
      when uuid_attribute?(key)                       then conditions[key] = value.to_uuid
      end
    end
  end
  private :map_uuid_field_values_to_uuid

  # MySQL decides that BINARY(16) columns really mean TINYBLOB(255), which is not what we mean, so we catch
  # the UUID column types and make damn sure that they are what we say they are.
  module ConnectionAdapter
    def self.included(base)
      base.class_eval do
        alias_method_chain(:type_to_sql, :uuids)
      end
    end

    def type_to_sql_with_uuids(type, limit = nil, precision = nil, scale = nil)
      (type.to_s == 'binary' && limit == 16) ? 'binary(16)' : type_to_sql_without_uuids(type, limit, precision, scale)
    end
  end

  # Extensions to the Ruby core classes to provide conversions to and from BINARY(16) UUIDs.
  module Extensions
    module NilClass
      def to_uuid
        nil
      end

      def to_uuid_as_string
        nil
      end
    end

    module String
      UUID_FIELD_GROUPS = [ [0,4], [4,2], [6,2], [8,2], [10,6] ]

      # Decodes a BINARY(16) representation of a UUID into the string representation.
      def to_uuid_as_string
        return nil if self.bytes.all?(&0.method(:==))
        hex_string = self.bytes.map { |x| x.to_s(0x10).rjust(2, '0') }
        UUID_FIELD_GROUPS.map { |x| hex_string[*x] }.map(&:join).join('-')
      end

      # Encodes a string representation of a UUID into its BINARY(16) form.
      def to_uuid
        self.gsub('-', '').chars.to_a.in_groups_of(2).map { |x| x.join.to_i(0x10).chr }.join
      end
    end
  end

  # This module is provided for converting an existing table so that the UUID columns are changed to BINARY(16).
  # All of the pre-existing indexes will be dropped by this migration.
  module Migration
    class NullHelper
      attr_reader :indexes
      def initialize(*indexes) ; @indexes = indexes ; end
      def constrain_column_to_not_null?(_) ; false ; end
    end

    def self.extended(base)
      base.class.instance_eval do
        delegate :quote_column_name, :to => :connection
      end
    end

    def OnlyIndexes(*indexes)
      NullHelper.new(*indexes)
    end

    def uuidify_table(table_name, migration_helper = NullHelper.new)
      # Find all of the UUID columns and build the appropriate SQL changes.  Make sure that we error if the
      # table doesn't look like it should be modified in any way.
      uuid_columns, non_uuid_columns = connection.columns(table_name).partition { |c| c.name =~ UUID_COLUMN_REGEXP }
      raise RuntimeError, "Table #{table_name} has no columns that look like UUIDs" if uuid_columns.blank?
      raise RuntimeError, "UUID column types for #{table_name} don't look like VARCHAR(36)" unless uuid_columns.all? { |c| c.type == :string }
      uuid_columns, non_uuid_columns = uuid_columns.map(&:name), non_uuid_columns.map(&:name).map(&method(:quote_column_name))

      insert_columns = [ non_uuid_columns, uuid_columns.map(&method(:quote_column_name)) ].flatten
      select_columns = [ non_uuid_columns, uuid_columns.map { |c| q = quote_column_name(c) ; "UNHEX(REPLACE(#{q},'-','')) AS #{q}" } ].flatten
      column_changes = uuid_columns.map do |c|
        extra  = migration_helper.constrain_column_to_not_null?(c) ? "NOT NULL" : ""
        quoted = quote_column_name(c)
        "CHANGE COLUMN #{quoted} #{quoted} BINARY(16) #{extra}" 
      end
      old_indexes = connection.indexes(table_name).map(&:name).map { |idx| "DROP INDEX #{idx}" }
      new_indexes = migration_helper.indexes.map { |columns| "ADD INDEX #{columns.join('_and_')}_idx(#{columns.map(&method(:quote_column_name)).join(',')})" }

      table_alterations = [ column_changes, old_indexes, new_indexes ].flatten

      # Now build a new table from the old one, switch the column types for UUIDs, copy the data from the old
      # table changing the UUIDs to the new column type, drop the original table and finally rename the new
      # one.
      connection.execute("CREATE TABLE uuidify_#{table_name} LIKE #{table_name}")
      connection.execute("ALTER TABLE uuidify_#{table_name} #{table_alterations.join(',')}")
      connection.execute("INSERT INTO uuidify_#{table_name}(#{insert_columns.join(',')}) SELECT #{select_columns.join(',')} FROM #{table_name}")
      connection.execute("DROP TABLE #{table_name}")
      connection.execute("RENAME TABLE uuidify_#{table_name} TO #{table_name}")
    end

    def down
      raise ActiveRecord::IrreversibleMigration, "Cannot undo this UUID change"
    end
  end
end

require 'active_record/base'
class ActiveRecord::Base
  extend Uuidable
end

require 'active_record/connection_adapters/mysql_adapter'
class ActiveRecord::ConnectionAdapters::MysqlAdapter
  include Uuidable::ConnectionAdapter
end

class String
  include Uuidable::Extensions::String
end
class NilClass
  include Uuidable::Extensions::NilClass
end
