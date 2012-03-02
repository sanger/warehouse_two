class MultiplexedLibraryTube < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id             => :id,
      :name                    => :name,
      :barcode                 => :barcode,
      :barcode_prefix          => :barcode_prefix,
      :state                   => :qc_state,
      :closed                  => :closed,
      :concentration           => :concentration,
      :volume                  => :volume,
      :two_dimensional_barcode => :two_dimensional_barcode,
      :scanned_in_date         => :scanned_in_date,
      :public_name             => :public_name
    }
  end

end
