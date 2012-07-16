class BillingEvent < ActiveRecord::Base
  include ResourceTools

  json do
    translate(
      :project_division  => :division,
      :project_cost_code => :cost_code
    )
  end
end
