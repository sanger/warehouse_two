class MultiplexedLibraryTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenceable
end
