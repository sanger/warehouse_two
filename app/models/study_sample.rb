class StudySample < ActiveRecord::Base
  include ResourceTools

  json do
    ignore(:studies, :samples)
    translate(:id => :internal_id)
  end
end
