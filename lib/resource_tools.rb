module ResourceTools
  def self.included(base)
    base.class_eval do
      set_primary_key :dont_use_id
      alias_attribute :id, :dont_use_id
      before_create :set_checked_at
      before_create :set_is_current

      def set_checked_at
        self.checked_at = correct_current_time
      end

      def correct_current_time
        self.class.default_timezone == :utc ? Time.now.utc : Time.now
      end
      
      def self.correct_current_time
        self.default_timezone == :utc ? Time.now.utc : Time.now
      end

      def set_is_current
        self.is_current = true
      end

      def self.create_or_update(resource_object)
        remote_values = parse_resource_object(resource_object)
        #FIXME: Inconsistency might occur if there is there might be more than one uuid with is_current set
        local_object = find_by_uuid_and_is_current(remote_values[:uuid],true)
        if local_object
          if local_object.updated_values?(remote_values)
            local_object.is_current = false
            remote_values[:inserted_at] = self.correct_current_time
            create(remote_values)
          else
            local_object.set_checked_at
          end
          local_object.save!
          local_object
        else
          remote_values[:inserted_at] = self.correct_current_time
          create(remote_values)
        end
      end

      def updated_values?(remote_values)
        remote_values.each do |key, value|
          next if value.blank? && send("#{key}")
          next if key == :last_updated || key == :created || key == :entry_date
          return true unless send("#{key}") == value
        end

        false
      end

      def self.parse_resource_object(resource_object)
        lc_class_name = self.model_name.underscore
        return {} if resource_object.nil? || resource_object.send("#{lc_class_name}").nil?
        translated_resource = {}
        map_internal_to_external_attributes.each do |internal_name, external_name|
          next if resource_object.send(lc_class_name).attributes[external_name.to_s].nil?
          translated_resource[internal_name] = resource_object.send(lc_class_name).send(external_name)
        end

        link_resources(resource_object)
        translated_resource
      end


    end
  end
end