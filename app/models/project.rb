class Project < ActiveRecord::Base
  include ResourceTools
  extend AssociatedWithRoles

  json do
    whitelist(*(Project.attribute_names+Project.roles))
    translate(:id => :internal_id)
  end
end
