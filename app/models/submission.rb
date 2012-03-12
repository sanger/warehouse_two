class Submission < ActiveRecord::Base
  include ResourceTools

  ignore_attribute(
    :study_uuid,
    :study_internal_id,
    :study_name,
    :project_uuid,
    :project_internal_id,
    :project_name,
    :orders
  )
end
