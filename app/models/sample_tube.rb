class SampleTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Libraryable

  json do
    whitelist(*SampleTube.attribute_names)
  end
end
