class SampleTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Libraryable
end
