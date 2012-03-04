class MultiplexedLibraryTube < ActiveRecord::Base
  include ResourceTools

  json do
    translate(
      :id       => :internal_id,
      :qc_state => :state
    )
  end
end
