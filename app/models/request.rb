class Request < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
    lc_class_name = self.model_name.underscore
    resource = resource_object.send(lc_class_name)
    if  resource.respond_to?(:target_asset_uuid) && resource.respond_to?(:source_asset_uuid) && ! resource.target_asset_uuid.blank? && ! resource.source_asset_uuid.blank?
      asset_link = AssetLink.find_by_ancestor_uuid_and_descendant_uuid_and_is_current(resource.source_asset_uuid,  resource.target_asset_uuid, true)
      unless asset_link
        ancestor_internal_id   = resource.respond_to?(:source_asset_internal_id) ? resource.source_asset_internal_id : nil
        ancestor_type   = resource.respond_to?(:source_asset_type) ? resource.source_asset_type : nil
        descendant_internal_id = resource.respond_to?(:target_asset_internal_id) ? resource.target_asset_internal_id : nil
        descendant_type = resource.respond_to?(:target_asset_type) ? resource.target_asset_type : nil
          
        AssetLink.create!(
          :ancestor_uuid   => resource.source_asset_uuid, 
          :ancestor_internal_id   => ancestor_internal_id, 
          :ancestor_type   => ancestor_type,
          :descendant_uuid => resource.target_asset_uuid,
          :descendant_internal_id => descendant_internal_id,
          :descendant_type => descendant_type
        )
      end
    end
    
    if resource.respond_to?(:study_uuid) && ! resource.study_uuid.blank?
      if resource.respond_to?(:source_asset_sample_uuid) && ! resource.source_asset_sample_uuid.blank?
        StudySample.find_or_create_by_sample_uuid_and_study_uuid(
          :sample_uuid => resource.source_asset_sample_uuid,
          :sample_internal_id => resource.respond_to?(:source_asset_sample_internal_id) ? resource.source_asset_sample_internal_id : nil,
          :study_uuid => resource.study_uuid,
          :study_internal_id => resource.respond_to?(:study_internal_id) ? resource.study_internal_id : nil
        )
      end
    
      if resource.respond_to?(:target_asset_sample_uuid) && ! resource.target_asset_sample_uuid.blank?
        StudySample.find_or_create_by_sample_uuid_and_study_uuid(
          :sample_uuid => resource.target_asset_sample_uuid,
          :sample_internal_id => resource.respond_to?(:target_asset_sample_internal_id) ? resource.target_asset_sample_internal_id : nil,
          :study_uuid => resource.study_uuid,
          :study_internal_id => resource.respond_to?(:study_internal_id) ? resource.study_internal_id : nil
        )
      end
    end
  
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                                 => :uuid,
      :internal_id                          => :id,
      :request_type                         => :request_type,
      :state                                => :state,
      :fragment_size_from                   => :fragment_size_required_from,
      :fragment_size_to                     => :fragment_size_required_to,
      :read_length                          => :read_length,
      :library_type                         => :library_type,
      :study_uuid                           => :study_uuid, 
      :study_internal_id                    => :study_internal_id, 
      :study_name                           => :study_name,
      :project_uuid                         => :project_uuid,
      :project_internal_id                  => :project_internal_id,
      :project_name                         => :project_name,
      :source_asset_uuid                    => :source_asset_uuid,
      :source_asset_internal_id             => :source_asset_internal_id,
      :source_asset_type                    => :source_asset_type,
      :source_asset_name                    => :source_asset_name,
      :source_asset_barcode                 => :source_asset_barcode,
      :source_asset_barcode_prefix          => :source_asset_barcode_prefix,
      :source_asset_state                   => :source_asset_state,
      :source_asset_closed                  => :source_asset_closed,
      :source_asset_two_dimensional_barcode => :source_asset_two_dimensional_barcode,
      :source_asset_sample_uuid             => :source_asset_sample_uuid,
      :source_asset_sample_internal_id      => :source_asset_sample_internal_id,
      :target_asset_uuid                    => :target_asset_uuid,    
      :target_asset_internal_id             => :target_asset_internal_id,   
      :target_asset_type                    => :target_asset_type,
      :target_asset_name                    => :target_asset_name,
      :target_asset_barcode                 => :target_asset_barcode,
      :target_asset_barcode_prefix          => :target_asset_barcode_prefix,
      :target_asset_state                   => :target_asset_state,
      :target_asset_closed                  => :target_asset_closed,
      :target_asset_two_dimensional_barcode => :target_asset_two_dimensional_barcode,
      :target_asset_sample_uuid             => :target_asset_sample_uuid,
      :target_asset_sample_internal_id      => :target_asset_sample_internal_id,
      :priority                             => :priority,
      :user                                 => :user,
      :last_updated                         => :updated_at,
      :created                              => :created_at
    }
  end

end