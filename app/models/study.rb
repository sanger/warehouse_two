class Study < ActiveRecord::Base
  include ResourceTools

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
