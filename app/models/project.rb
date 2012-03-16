class Project < ActiveRecord::Base
  include ResourceTools

  json do
    ignore(:manager, :follower, :owner)
    translate(:id => :internal_id)
  end
end
