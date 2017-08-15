class StudySample < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*StudySample.attribute_names)

    translate(:id => :internal_id)
  end
end
