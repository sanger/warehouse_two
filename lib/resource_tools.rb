module ResourceTools
  extend ActiveSupport::Concern
  include Uuidable

  included do
    self.primary_key = :dont_use_id

    # The original data information is stored here
    attr_accessor :data

    # A few useful named scopes
    scope :current, where(:is_current => true)
    scope :not_current, where(:is_current => false)
    scope :for_uuid, lambda { |uuid| where(:uuid => uuid) }
    scope :not_record, lambda { |record| where('dont_use_id != ?', record.dont_use_id) }
    scope :most_recent, order('last_updated DESC')

    # Ensure that the time stamps are correct whenever a record is updated
    before_create { |record| record.inserted_at = record.correct_current_time }
    before_save   { |record| record.checked_at  = record.checked_time_now }

    # Ensure that on creation the currentness of the records are maintained
    before_create(:maintain_our_currentness)
    after_create(:maintain_other_currentness, :if => :considered_most_recent_version?)

    delegate :correct_current_time, :to => 'self.class'
    delegate :checked_time_now, :to => 'self.class'
  end

  # A new record means old records are no longer current.  This means that they go out of being
  # current at the point our record was modified.
  def maintain_other_currentness
    current_versions.not_record(self).update_all("is_current=FALSE, current_to=#{self.last_updated.to_s(:db).inspect}")
  end
  private :maintain_other_currentness

  # A new record is current iff it has not been deleted and it is the most up-to-date.
  def maintain_our_currentness
    self.current_from = self.created
    if deleted? or not considered_most_recent_version?
      self.is_current = false
      self.current_to = self.last_updated
    else
      self.is_current = true
      self.current_to = nil
    end
    true
  end
  private :maintain_our_currentness

  def current_versions
    self.class.for_uuid(self.uuid).current
  end
  private :current_versions

  # Can this record be considered the most recent version?
  def considered_most_recent_version?
    currently_most_recent = current_versions.most_recent.first
    currently_most_recent.nil? or (currently_most_recent == self) or (currently_most_recent.last_updated <= self.last_updated)
  end
  private :considered_most_recent_version?

  # Has this record been deleted remotely
  def deleted?
    deleted_at.present?
  end

  IGNOREABLE_ATTRIBUTES = [ 'dont_use_id', 'is_current', 'inserted_at', 'checked_at', 'current_from', 'current_to' ]

  def updated_values?(object)
    us, them = self.attributes.stringify_keys, object.attributes.stringify_keys.reverse_slice(IGNOREABLE_ATTRIBUTES)
    not us.within_acceptable_bounds?(them)
  end

  def checked!
    self.save!
    self
  end

  def check(object)
    updated_values?(object) ? yield : checked!
  end

  module ClassMethods
    def correct_current_time
      self.default_timezone == :utc ? Time.now.utc : Time.now
    end
    private :correct_current_time

    def checked_time_now
      correct_current_time
    end
    private :checked_time_now

    def create_or_update_from_json(json)
      create_or_update(self::Json.new(json))
    end

    def create_or_update(attributes)
      new_object   = new(attributes.reverse_merge(:data => attributes))
      local_object = current.for_uuid(new_object.uuid).first
      local_object.check(new_object) { new_object.save! ; new_object }
    end
    private :create_or_update

    def json(&block)
      const_set(:Json, Class.new(ResourceTools::Json)) unless const_get(:Json).parent == self
      const_get(:Json).tap { |json_handler| json_handler.instance_eval(&block) }
    end
    private :json
  end

  class Json < Hashie::Mash
    class_attribute :translations
    self.translations = {}

    class_attribute :ignoreable
    self.ignoreable = []

    class << self
      # Hashes in subkeys might as well be normal Hashie::Mash instances as we don't want to bleed
      # the key conversion further into the data.
      def subkey_class
        Hashie::Mash
      end

      def ignore(*attributes)
        self.ignoreable += attributes.map(&:to_s)
      end

      # JSON attributes can be translated into the attributes on the way in.
      def translate(details)
        self.translations = Hash[details.map { |k,v| [k.to_s, v.to_s] }].reverse_merge(self.translations)
      end

      def convert_key(key)
        translations[key.to_s] || key.to_s
      end
      private :convert_key
    end

    def initialize(*args, &block)
      super
      delete_if { |k,_| ignoreable.include?(k) }
    end

    delegate :convert_key, :to => 'self.class'

    translate(:updated_at => :last_updated, :created_at => :created)
  end

  module CoreExtensions
    module Hash
      # Determines if this hash is within an acceptable bounds of the keys common with the
      # given hash.  It is assumed that values missing from 'other' are unchanged.
      def within_acceptable_bounds?(other)
        (self.keys & other.keys).all? do |key|
          self[key].within_acceptable_bounds?(other[key])
        end
      end

      # Does the opposite of slice, returning a hash that does not have the specified keys!
      def reverse_slice(*keys)
        keys.flatten!
        dup.delete_if { |k,_| keys.include?(k) }
      end
    end

    module Object
      def within_acceptable_bounds?(value)
        self == value
      end
    end

    module String
      def within_acceptable_bounds?(value)
        return false if value.nil?
        self == value.to_s
      end
    end

    module Numeric
      extend ActiveSupport::Concern

      included do
        delegate :numeric_tolerance, :to => 'self.class'
      end

      module ClassMethods
        def numeric_tolerance
          @numeric_tolerance ||= WarehouseTwo::Application.config.numeric_tolerance
        end
      end

      def within_acceptable_bounds?(v)
        return false if v.nil?
        (self - v).abs < numeric_tolerance
      end
    end

    module NilClass
      def check(_)
        yield
      end
    end
  end
end

# Extend the core classes with the behaviour we need
class Hash     ; include ResourceTools::CoreExtensions::Hash     ; end
class Object   ; include ResourceTools::CoreExtensions::Object   ; end
class String   ; include ResourceTools::CoreExtensions::String   ; end
class Numeric  ; include ResourceTools::CoreExtensions::Numeric  ; end
class NilClass ; include ResourceTools::CoreExtensions::NilClass ; end
