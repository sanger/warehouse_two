class PacBioLibraryTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenceable

  json do
    whitelist(*PacBioLibraryTube.attribute_names)
  end
end
