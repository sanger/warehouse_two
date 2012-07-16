module ResourceTools::CoreExtensions
  module Hash
    # Determines if this hash is within an acceptable bounds of the keys common with the
    # given hash.  It is assumed that values missing from 'other' are unchanged.
    def within_acceptable_bounds?(other)
      (self.keys & other.keys).all? do |key|
        self[key].within_acceptable_bounds?(other[key])
      end
    end

    # Does the opposite of slice, returning a hash that does not have the specified keys!
    def reverse_slice(*keys)
      keys.flatten!
      dup.delete_if { |k,_| keys.include?(k) }
    end
  end

  module Object
    def within_acceptable_bounds?(value)
      self == value
    end
  end

  module String
    def within_acceptable_bounds?(value)
      return false if value.nil?
      self == value.to_s
    end
  end

  module Numeric
    extend ActiveSupport::Concern

    included do
      delegate :numeric_tolerance, :to => 'self.class'
    end

    module ClassMethods
      def numeric_tolerance
        @numeric_tolerance ||= WarehouseTwo::Application.config.numeric_tolerance
      end
    end

    def within_acceptable_bounds?(v)
      return false if v.nil?
      (self - v).abs < numeric_tolerance
    end
  end

  module NilClass
    def check(_)
      yield
    end
  end
end

# Extend the core classes with the behaviour we need
class Hash     ; include ResourceTools::CoreExtensions::Hash     ; end
class Object   ; include ResourceTools::CoreExtensions::Object   ; end
class String   ; include ResourceTools::CoreExtensions::String   ; end
class Numeric  ; include ResourceTools::CoreExtensions::Numeric  ; end
class NilClass ; include ResourceTools::CoreExtensions::NilClass ; end
