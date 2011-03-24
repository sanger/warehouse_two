class Lane < ActiveRecord::Base
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
      :state                   => :qc_state,
      :external_release        => :external_release,
      :two_dimensional_barcode => :two_dimensional_barcode,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end