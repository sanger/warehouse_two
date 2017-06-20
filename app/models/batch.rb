class Batch < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*Batch.attribute_names)
    translate(:id => :internal_id)
  end
end
