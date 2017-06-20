class Plate < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*Plate.attribute_names)

    translate(
      :id   => :internal_id,
      :size => :plate_size
    )
  end
end
