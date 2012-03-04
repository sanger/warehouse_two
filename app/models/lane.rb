class Lane < ActiveRecord::Base
  include ResourceTools

  json do
    translate(:qc_state => :state)
  end
end
