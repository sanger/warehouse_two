class SubmittedAsset < ActiveRecord::Base
  self.primary_key = :dont_use_id

  scope :for_order, lambda { |order| for_order_uuid(order.uuid) }
  scope :for_order_uuid, lambda { |uuid| where(:order_uuid => uuid) }
end
