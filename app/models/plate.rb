class Plate < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                        => :uuid,
      :internal_id                 => :id,
      :name                        => :name,
      :barcode                     => :barcode,
      :barcode_prefix              => :barcode_prefix,
      :plate_size                  => :size,
      :plate_purpose_name          => :plate_purpose_name,
      :plate_purpose_internal_id   => :plate_purpose_internal_id,
      :plate_purpose_uuid          => :plate_purpose_uuid,
      :infinium_barcode            => :infinium_barcode,
      :location                    => :location,
      :last_updated                => :updated_at,
      :created                     => :created_at
    }
  end

end