module ResourceTools::Json
  extend ActiveSupport::Concern

  module ClassMethods
    def create_or_update_from_json(json_data)
      create_or_update(json.new(json_data))
    end

    def json(&block)
      const_set(:JsonHandler, Class.new(ResourceTools::Json::Handler)) unless const_defined?(:JsonHandler)
      const_get(:JsonHandler).tap { |json_handler| json_handler.instance_eval(&block) if block_given? }
    end
    private :json
  end

  class Handler < Hashie::Mash
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
end
