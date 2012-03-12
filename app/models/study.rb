class Study < ActiveRecord::Base
  include ResourceTools

  ignore_attribute(
    :projects,
    :commercially_available,
    :samples
  )

  json do
    translate(
      :id          => :internal_id,
      :sac_sponsor => :faculty_sponsor
    )
  end
end
