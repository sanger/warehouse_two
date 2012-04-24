class Project < ActiveRecord::Base
  include ResourceTools
  extend AssociatedWithRoles

  json do
    translate(:id => :internal_id)
  end
end
