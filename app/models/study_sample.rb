class StudySample < ActiveRecord::Base
  include ResourceTools

  json do
    translate(:id => :internal_id)
  end
end
