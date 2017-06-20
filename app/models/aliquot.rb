class Aliquot < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*Aliquot.attribute_names)
    translate(
      :id                               => :internal_id,
      :bait_library_name                => :bait_name,
      :bait_library_target_species      => :bait_target_species,
      :bait_library_supplier_identifier => :bait_supplier_identifier,
      :bait_library_supplier_name       => :bait_supplier_name
    )
  end
end
