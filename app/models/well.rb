class Well < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
    lc_class_name = self.model_name.underscore
    resource = resource_object.send(lc_class_name)
    if  resource.respond_to?(:plate_uuid) && ! resource.plate_uuid.blank?
      AssetLink.find_or_create_by_ancestor_uuid_and_descendant_uuid(
        :descendant_uuid => resource.uuid,
        :descendant_internal_id => resource.internal_id,
        :descendant_type => 'wells',
        :ancestor_uuid   => resource.plate_uuid, 
        :ancestor_type   => 'plates'
      )
    end
    
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                    => :uuid,
      :internal_id             => :internal_id,
      :name                    => :name,
      :map                     => :map,
      :plate_barcode           => :plate_barcode,
      :plate_barcode_prefix    => :plate_barcode_prefix,
      :plate_uuid              => :plate_uuid,
      :sample_uuid             => :sample_uuid,
      :sample_internal_id      => :sample_internal_id,
      :sample_name             => :sample_name,
      :gel_pass                => :gel_pass,
      :concentration           => :concentration,
      :current_volume          => :current_volume,
      :buffer_volume           => :buffer_volume,
      :requested_volume        => :requested_volume,
      :picked_volume           => :picked_volume,
      :pico_pass               => :pico_pass,
      :measured_volume         => :measured_volume,
      :sequenom_count          => :sequenom_count,
      :gender_markers          => :gender_markers,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end