class Event < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*Event.attribute_names)
    translate(
      :eventful_internal_id => :source_internal_id,
      :eventful_uuid        => :source_uuid,
      :eventful_type        => :source_type
    )
  end
end
