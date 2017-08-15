class MultiplexedLibraryTube < ActiveRecord::Base
  include ResourceTools
  include Labware::Sequenceable

   json do
    whitelist(*MultiplexedLibraryTube.attribute_names)
  end
end
