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

        json do
          ignore(:lanes, :requests)
        end
      end
    end
  end

  module Libraryable
    def self.included(base)
      base.class_eval do
        include Labware

        json do
          ignore(:library_tubes, :requests)
        end
      end
    end
  end

  module Sequenced
    def self.included(base)
      base.class_eval do
        include Labware

        json do
          ignore(:requests)
        end
      end
    end
  end
end
