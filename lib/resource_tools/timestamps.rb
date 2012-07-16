module ResourceTools::Timestamps
  extend ActiveSupport::Concern

  included do
    # Ensure that the time stamps are correct whenever a record is updated
    before_create { |record| record.inserted_at = record.correct_current_time }
    before_save   { |record| record.checked_at  = record.checked_time_now }

    delegate :correct_current_time, :to => 'self.class'
    delegate :checked_time_now, :to => 'self.class'
  end

  module ClassMethods
    def correct_current_time
      self.default_timezone == :utc ? Time.now.utc : Time.now
    end
    private :correct_current_time

    def checked_time_now
      correct_current_time
    end
    private :checked_time_now
  end
end
