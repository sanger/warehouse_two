class Lane < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenced
end
