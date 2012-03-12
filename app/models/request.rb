class Request < ActiveRecord::Base
  include ResourceTools

  ignore_attribute(
    :project_url,
    :study_url,
    :submission_url
  )

  json do
    translate(
      :id                          => :internal_id,
      :fragment_size_required_from => :fragment_size_from,
      :fragment_size_required_to   => :fragment_size_to
    )
  end
end
