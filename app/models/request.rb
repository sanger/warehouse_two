class Request < ActiveRecord::Base
  include ResourceTools

  json do
    translate(
      :id                          => :internal_id,
      :fragment_size_required_from => :fragment_size_from,
      :fragment_size_required_to   => :fragment_size_to
    )
  end
end
