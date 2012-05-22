module ResourceTools::SequenceOfDates
  extend ActiveSupport::Concern

  def is_current?
    date_sequence_to.nil?
  end
  alias_method(:current?, :is_current?)

  # A new record is current iff it has not been deleted and it is the most up-to-date.  All records are current
  # from the point at which they were updated; non-current records, however, have a point at which they were
  # deleted or when they were updated.
  def maintain_our_currentness
    # Assume the record is current to start with.
    self.date_sequence_from = self.last_updated
    self.date_sequence_to   = nil

    # If we are deleted then we are definitely not current.  If there are records that start after our start
    # then we are not current.
    if deleted?
      self.date_sequence_from, self.date_sequence_to = self.deleted_at, self.deleted_at
    elsif records_after_us?
      self.date_sequence_to = related.current_after(self.date_sequence_from).first.date_sequence_from
    end

    # TODO: Remove this once the is_current column has been removed from third party queries
    self.is_current = self.date_sequence_to.nil?

    # NOTE: Do not remove this line as weird stuff can happen with AR callbacks and false/nil
    true
  end
  private :maintain_our_currentness

  def records_after_us?
    related.records_after(self.date_sequence_from).exists?
  end
  private :records_after_us?

  # Ensures that this record ends its currency when the specified record starts.  Effectively we're saying
  # "I *run into* that record".
  def runs_into(record)
    # NOTE: We cannot use the normal ActiveRecord saving here because we are changing a value concerned with
    # the primary key that identifies this record.  Hence we have to do the update ourselves using good
    # old SQL!
    #
    # TODO: Remove the 'is_current=>false' once the is_current column has been removed from third party queries
    self.class.updating(self).update_all("`#{date_sequence_to_attribute}`=#{record.date_sequence_from.to_s.inspect}, `is_current`=false")
  end

  # Ensures that this record starts its currency when the specified record finishes.  Effectively we're
  # saying "I *run out of* that record".
  def runs_out_of(record)
    update_attributes!(date_sequence_from_attribute => record.date_sequence_to)
  end

  module ClassMethods
    def sequence_of_dates_over(from_attribute, to_attribute)
      alias_attribute(:date_sequence_from, from_attribute)
      alias_attribute(:date_sequence_to,   to_attribute)
      define_method(:date_sequence_from_attribute) { from_attribute }
      define_method(:date_sequence_to_attribute) { to_attribute }

      from_field, to_field = [from_attribute,to_attribute].map(&self.connection.method(:quote_column_name))

      scope :current,     where("#{to_field} IS NULL")
      scope :not_current, where("#{to_field} IS NOT NULL")

      scope :ordered_future, order("#{from_field} ASC")
      scope :ordered_history, order("#{from_field} DESC")

      # The date range for a record is "[current_from,current_to)".  That is, records are current from their
      # current_from date, all the way to, but not including, their current_to date.  This is because there
      # could be a record that has yet to be created that is current for now.
      scope :records_after,  lambda { |datetime| where("#{from_field} >  ?", datetime) }
      scope :current_after,  lambda { |datetime| where("#{from_field} >  ?", datetime).ordered_future }
      scope :current_before, lambda { |datetime| where("#{to_field}   <= ?", datetime).ordered_history }

      scope :leading_from, lambda { |r|
        where(
          "? <= #{from_field} AND #{from_field} < ?",
          r.date_sequence_from, r.date_sequence_to
        ).ordered_future
      }
      scope :leading_to, lambda { |r|
        where(
          "#{from_field} <= ? AND ((#{to_field} IS NOT NULL AND ? < #{to_field}) OR (#{to_field} IS NULL))",
          r.date_sequence_from, r.date_sequence_from
        ).ordered_history
      }

      # Ensure that on creation the currentness of the records are maintained.
      before_create(:maintain_our_currentness)
      before_create(:if => lambda { |r| r.deleted? or not r.current? }) do
        related.leading_from(self).first.runs_out_of(self)
      end
      before_create do |record|
        related.leading_to(self).first.runs_into(self)
      end
    end
  end

  # Extension for NilClass so that we don't have to do 'unless x.nil?'
  module NilClass
    def runs_into(_)
      # Do nothing!
    end

    def runs_out_of(_)
      # Do nothing!
    end
  end
end

class NilClass
  include ResourceTools::SequenceOfDates::NilClass
end
