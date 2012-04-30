class Study < ActiveRecord::Base
  include ResourceTools
  extend AssociatedWithRoles
  has_role(:data_access_contact)

  json do
    ignore(
      :projects,
      :commercially_available,
      :samples
    )
    translate(
      :id                    => :internal_id,
      :sac_sponsor           => :faculty_sponsor,
      :"data access contact" => :data_access_contact
    )
  end
end
