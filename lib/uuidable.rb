# Extend ActiveRecord::Base with this module and all UUID columns will be automatically handled as though they
# are stored as BINARY(16) in the database but accessible as their string representations from code.
module Uuidable
  # MySQL decides that BINARY(16) columns really mean TINYBLOB(255), which is not what we mean, so we catch
  # the UUID column types and make damn sure that they are what we say they are.
  module ConnectionAdapter
    def self.included(base)
      base.class_eval do
        alias_method_chain(:new_column, :uuid)
        const_set(:UuidColumn, Class.new(base::Column) { extend UuidColumnBehaviour })
      end
    end

    # Ensures that a UUID column converts the values appropriately
    module UuidColumnBehaviour
      def string_to_binary(value)
        value.to_uuid
      end

      def binary_to_string(value)
        value.from_uuid
      end
    end

    # Ensures that any BINARY(16) columns are considered to be UUIDs, converting their values to
    # and from strings.
    def new_column_with_uuid(field, default, type, null, collation)
      constructor = (type == 'binary(16)') ? self.class::UuidColumn.method(:new) : method(:new_column_without_uuid)
      constructor.call(field, default, type, null, collation)
    end
  end

  # Extensions to the Ruby core classes to provide conversions to and from BINARY(16) UUIDs.
  module Extensions
    module NilClass
      def to_uuid
        nil
      end

      def from_uuid
        nil
      end
    end

    module String
      class NonUuidError < StandardError ; end

      # Returns a binary representation of this UUID string.  It will raise a NonUuidError if the string is
      # neither in the character nor the binary format.
      def to_uuid
        try_string_to_binary { |_,binary| return binary }
        try_binary_to_string { |_,binary| return binary }
        raise NonUuidError, self
      end

      # Returns a character representation of this binary UUID string.  It will raise a NonUuidError if the
      # string is neither in the character nor the binary format.
      def from_uuid
        try_binary_to_string { |string,_| return string }
        try_string_to_binary { |string,_| return string }
        raise NonUuidError, self
      end

      # Attempts to convert the instance to its binary representation, yielding on success.  If the 
      # method returns then the string may already be in binary format, so that should be checked.
      def try_string_to_binary(&block)
        catch(:possibly_already_binary) {
          binary_representation = from_string_to_binary
          string_representation = binary_representation.from_binary_to_string
          return yield(string_representation, binary_representation) if string_representation == self
        }
      end
      private :try_string_to_binary

      # Attempts to convert the instance to its string representation, yielding on success.  If the
      # method returns then the string may already be in string format, so that should be checked.
      def try_binary_to_string(&block)
        catch(:possibly_already_string) {
          string_representation = from_binary_to_string
          binary_representation = string_representation.from_string_to_binary
          return yield(string_representation, binary_representation) if binary_representation == self
        }
      end
      private :try_binary_to_string

      def from_binary_to_string
        self.unpack('H8H4H4H4H12').join('-')
      end
      protected :from_binary_to_string

      def from_string_to_binary
        self.split('-').pack('H8H4H4H4H12')
      rescue ArgumentError => exception
        throw :possibly_already_binary
      end
      protected :from_string_to_binary
    end
  end

  # This module is provided for converting an existing table so that the UUID columns are changed to BINARY(16).
  # All of the pre-existing indexes will be dropped by this migration.
  module Migration
    class NullHelper
      attr_reader :indexes
      def initialize(*indexes) ; @indexes = indexes ; end
      def constrain_column_to_not_null?(column) ; column.to_sym == :uuid ; end
    end

    def self.extended(base)
      base.class.instance_eval do
        delegate :quote_column_name, :to => :connection
      end
    end

    def OnlyIndexes(*indexes)
      NullHelper.new(*indexes)
    end

    UUID_COLUMN_REGEXP = /^(.+_)?uuid$/

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

require 'active_record/connection_adapters/mysql2_adapter'
class ActiveRecord::ConnectionAdapters::Mysql2Adapter
  include Uuidable::ConnectionAdapter
end

class String
  include Uuidable::Extensions::String
end
class NilClass
  include Uuidable::Extensions::NilClass
end
