class <%= singular_name.camelize %> < ActiveRecord::Base
  include ResourceTools
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                    => :uuid,
      :internal_id             => :internal_id,
      
      # Add custom column mappings here
      
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end
