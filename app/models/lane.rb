class Lane < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenced

  json do
    whitelist(*Lane.attribute_names)
  end
end
