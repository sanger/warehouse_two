class PacBioLibraryTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenceable
end
