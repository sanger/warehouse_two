class UuidObject < ActiveRecord::Base
  set_primary_key :dont_use_id
  alias_attribute :id, :dont_use_id
  alias_method(:dont_use_id_before_type_cast, :id_before_type_cast)
  
  def update_or_delete(current_time)
    begin 
      remote_resource = eval("Api::#{self.object_name.camelize.singularize}").find(self.uuid)
      eval(self.object_name.camelize.singularize).create_or_update(remote_resource)
      self.update_attributes!(:checked_at => current_time)
    rescue ActiveResource::ServerError
    rescue ActiveResource::ResourceNotFound
      delete_local_object(current_time)
    end
    
    nil
  end
  
  def delete_local_object(current_time)
    local_objects = eval(self.object_name.camelize.singularize).find_all_by_uuid_and_is_current(self.uuid, true)
    unless local_objects.blank?
      local_objects.each do |local_object|
        local_object.update_attributes!(:is_current => false, :checked_at => current_time)
      end
    end
    self.update_attributes!(:checked_at => current_time, :deleted => true)
  
    nil
  end
  
end