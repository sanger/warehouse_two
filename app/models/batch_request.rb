class BatchRequest < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*BatchRequest.attribute_names)
  end
end
