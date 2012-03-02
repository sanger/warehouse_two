class Lane < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id             => :internal_id,
      :name                    => :name,
      :barcode                 => :barcode,
      :barcode_prefix          => :barcode_prefix,
      :state                   => :qc_state,
      :external_release        => :external_release,
      :two_dimensional_barcode => :two_dimensional_barcode
    }
  end

end
