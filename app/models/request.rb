class Request < ActiveRecord::Base
  include ResourceTools

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
      :submission_uuid                      => :submission_uuid, 
      :submission_internal_id               => :submission_internal_id, 
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
