class Study < ActiveRecord::Base
  include ResourceTools
  extend AssociatedWithRoles
  has_role(:data_access_contact)
  has_role(:slf_manager)
  has_role(:lab_manager)

  json do
    ignore(
      :projects,
      :commercially_available,
      :samples
    )
    translate(
      :id          => :internal_id,
      :sac_sponsor => :faculty_sponsor
    )
  end
end
