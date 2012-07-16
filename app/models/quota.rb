class Quota < ActiveRecord::Base
  self.table_name = 'quotas'
  include ResourceTools
end
