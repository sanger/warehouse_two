class Project < ActiveRecord::Base
  include ResourceTools

  json do
    ignore(:manager, :follower)
    translate(:id => :internal_id)
  end
end
