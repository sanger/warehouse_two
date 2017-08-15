class AssetLink < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*AssetLink.attribute_names)
  end
end
