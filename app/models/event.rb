class Event < ActiveRecord::Base
  include ResourceTools

  ignore_attribute(:family)

  json do
    translate(
      :eventful_internal_id => :source_internal_id,
      :eventful_uuid        => :source_uuid,
      :eventful_type        => :source_type
    )
  end
end
