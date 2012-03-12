module Labware
  def self.included(base)
    base.class_eval do
      json do
        translate(
          :id       => :internal_id,
          :qc_state => :state
        )
      end
    end
  end

  module Sequenceable
    def self.included(base)
      base.class_eval do
        include Labware
        ignore_attribute(:lanes, :requests)
      end
    end
  end

  module Libraryable
    def self.included(base)
      base.class_eval do
        include Labware
        ignore_attribute(:library_tubes, :requests)
      end
    end
  end

  module Sequenced
    def self.included(base)
      base.class_eval do
        include Labware
        ignore_attribute(:requests)
      end
    end
  end
end
