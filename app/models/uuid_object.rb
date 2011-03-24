class UuidObject < ActiveRecord::Base
  set_primary_key :dont_use_id
  alias_attribute :id, :dont_use_id
  alias_method(:dont_use_id_before_type_cast, :id_before_type_cast)
end