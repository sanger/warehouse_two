class Submission < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*Submission.attribute_names)
  
  end
end
