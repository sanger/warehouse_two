class Aliquot < ActiveRecord::Base
  include ResourceTools

  ignore_attribute(:sample_url, :receptacle_url)

  json do
    translate(:id => :internal_id)
  end
end
