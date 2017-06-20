class ReferenceGenome < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*ReferenceGenome.attribute_names)
  end
end
