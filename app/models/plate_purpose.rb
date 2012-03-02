class PlatePurpose < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id => :internal_id,
      :name        => :name
    }
  end

end
