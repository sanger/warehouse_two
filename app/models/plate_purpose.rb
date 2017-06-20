class PlatePurpose < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*PlatePurpose.attribute_names)
  end
end
