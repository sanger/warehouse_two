class Project < ActiveRecord::Base
  include ResourceTools

  json do
    ignore(:manager, :follower, :owner, :administrator)
    translate(:id => :internal_id)
  end
end
