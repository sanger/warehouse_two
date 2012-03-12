class LibraryTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenceable
end
