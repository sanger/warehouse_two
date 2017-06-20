class LibraryTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenceable

  json do
    whitelist(*LibraryTube.attribute_names)
  end
end
