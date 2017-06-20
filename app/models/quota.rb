class Quota < ActiveRecord::Base
  self.table_name = 'quotas'
  include ResourceTools

  json do
    whitelist(*Quota.attribute_names)
  end
end
