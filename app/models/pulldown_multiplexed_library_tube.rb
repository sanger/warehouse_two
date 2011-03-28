class PulldownMultiplexedLibraryTube < ActiveRecord::Base
  include ResourceTools

  def self.link_resources(resource_object)
  end

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                    => :uuid,
      :internal_id             => :internal_id,
      :name                    => :name,
      :barcode                 => :barcode,
      :barcode_prefix          => :barcode_prefix,
      :state                   => :state,
      :closed                  => :closed,
      :concentration           => :concentration,
      :volume                  => :volume,
      :two_dimensional_barcode => :two_dimensional_barcode,
      :scanned_in_date         => :scanned_in_date,
      :public_name             => :public_name,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end