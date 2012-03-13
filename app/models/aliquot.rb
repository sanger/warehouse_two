class Aliquot < ActiveRecord::Base
  include ResourceTools

  json do
    ignore(:sample_url, :receptacle_url)
    translate(:id => :internal_id)
  end
end
