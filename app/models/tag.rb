class Tag < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*Tag.attribute_names)
  end
end
