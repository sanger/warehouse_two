class Well < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenceable

  json do
    whitelist(*Well.attribute_names)
  end
end
