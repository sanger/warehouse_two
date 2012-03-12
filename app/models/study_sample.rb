class StudySample < ActiveRecord::Base
  include ResourceTools

  ignore_attribute(:studies, :samples)

  json do
    translate(:id => :internal_id)
  end
end
