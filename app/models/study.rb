class Study < ActiveRecord::Base
  include ResourceTools

  json do
    translate(
      :id          => :internal_id,
      :sac_sponsor => :faculty_sponsor
    )
  end
end
