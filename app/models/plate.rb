class Plate < ActiveRecord::Base
  include ResourceTools

  json do
    translate(
      :id   => :internal_id,
      :size => :plate_size
    )
  end
end
