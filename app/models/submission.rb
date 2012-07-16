class Submission < ActiveRecord::Base
  include ResourceTools

  json do
    ignore(
      :study_uuid,
      :study_internal_id,
      :study_name,
      :project_uuid,
      :project_internal_id,
      :project_name,
      :orders
    )
  end
end
