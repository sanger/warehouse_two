class <%= singular_name.classify %> < ActiveRecord::Base
  include ResourceTools

  # TODO: Uncomment and modify the following to adjust the behaviour of the JSON translation
#  json do
#    translate(:id => :internal_id)
#  end
end
