class SubmittedAsset < ActiveRecord::Base
  set_primary_key :dont_use_id
  alias_attribute :id, :dont_use_id
end