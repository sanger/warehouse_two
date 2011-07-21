module ResourceTools
  def self.included(base)
    base.class_eval do
      set_primary_key :dont_use_id
      alias_attribute :id, :dont_use_id
      before_create :set_checked_at
      before_create :set_is_current
      validate :unique_is_current_for_uuid, :on => :create
      
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

      def self.fix_duplicate_is_current_and_return_one(uuid)
        all_is_current_objects = find_all_by_uuid_and_is_current(uuid,true)
        current_object = all_is_current_objects.shift
        if all_is_current_objects.size >= 1
          all_is_current_objects.each do |duplicate_current_object|
            duplicate_current_object.is_current = false
            duplicate_current_object.save(false)
          end
        end
        
        current_object
      end

      def self.create_or_update(resource_object)
        remote_values = parse_resource_object(resource_object)
        local_object = fix_duplicate_is_current_and_return_one(remote_values[:uuid])
        if local_object
          if local_object.updated_values?(remote_values)
            local_object.is_current = false
            local_object.save!
            remote_values[:inserted_at] = self.correct_current_time
            create(remote_values)
          else
            local_object.set_checked_at
            local_object.save!
          end
          local_object
        else
          remote_values[:inserted_at] = self.correct_current_time
          create(remote_values)
        end
      end

      def updated_values?(remote_values)
        remote_values.each do |key, value|
          return true if changed_value?(key, value, [:last_updated, :created, :entry_date])
        end

        false
      end
      
      def updated_values_for_given_row?(old_row)
        old_row.attributes.each do |key, value|
           return true if changed_value?(key.to_sym, value, [:last_updated, :created, :entry_date, :is_current, :dont_use_id, :inserted_at , :checked_at])
        end

        false
      end
      
      def changed_value?(key, value, keys_to_ignore)
        return false if keys_to_ignore.include?(key)  
        return true if value.is_a?(FalseClass) && respond_to?("#{key}") && send("#{key}")
        return false if value.blank? && ! respond_to?("#{key}")
        return false if value.blank? && send("#{key}").blank?
        if value.is_a?(BigDecimal) || value.is_a?(Float)
           db_value = send("#{key}")
           # Floating point values don't work with ==
           return true unless (db_value-value).abs < 0.05
        else 
           return true unless send("#{key}") == value
        end
        
        false
      end

      def self.parse_resource_object(resource_object)
        lc_class_name = self.model_name.underscore
        return {} if resource_object.nil? || resource_object.send("#{lc_class_name}").nil?
        translated_resource = {}
        map_internal_to_external_attributes.each do |internal_name, external_name|
          translated_resource[internal_name] = [lc_class_name.to_sym, external_name ].flatten.inject(resource_object) { |o,m| o.respond_to?(m) ? o.try(:send, m) : nil }
        end

        link_resources(resource_object)
        translated_resource
      end
    end
    
    
    def unique_is_current_for_uuid
      errors.add(:uuid, 'Duplicate current UUID') if self.class.find_all_by_uuid_and_is_current(self.uuid,true).count > 1 if self.uuid
    end
  end
  
end
