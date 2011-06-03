class Well < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
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
      :genotyping_status       => :genotyping_status,
      :genotyping_snp_plate_id => :genotyping_snp_plate_id,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end