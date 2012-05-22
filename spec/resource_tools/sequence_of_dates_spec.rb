require 'spec_helper'

describe ResourceTools::SequenceOfDates do
  class SequencedRecord < ActiveRecord::Base
    self.table_name = 'sequenced_records'

    scope :updating, lambda { |record| where(:id => record.id) }

    include ResourceTools::SequenceOfDates
    sequence_of_dates_over(:from, :to)

    def deleted?
      deleted_at.present?
    end

    def related
      self.class.where(:grouping => self.grouping)
    end
  end
  
  before(:all) do
    ActiveRecord::Base.connection.create_table(:sequenced_records) do |table|
      table.integer  :grouping, :null => false

      table.datetime :last_updated
      table.datetime :deleted_at

      table.datetime :from
      table.datetime :to

      table.boolean :is_current
    end
  end
  after(:all) do
    ActiveRecord::Base.connection.drop_table(:sequenced_records)
  end

  subject { SequencedRecord }

  let(:now) { Time.parse('2012-Mar-20 11:00') }

  context 'single instance' do
    let(:attributes) { {} }

    before(:each) { subject.create!(attributes.reverse_merge(:grouping => 2, :last_updated => now)) }

    it 'has only one record' do
      subject.count.should == 1
    end

    context 'when not deleted' do
      it 'is current' do
        subject.last.should be_current
        subject.last[:is_current].should be_true
      end
    end

    context 'when deleted' do
      let(:attributes) { { :deleted_at => now + 1.day } }

      it 'is not current' do
        subject.last.should_not be_current
        subject.last[:is_current].should_not be_true
      end

      it 'ends at the deletion date' do
        subject.last.to.should == subject.last.deleted_at
      end
    end
  end

  context 'with identical timestamps' do
    (2..3).each do |number_of_records|
      context "with #{number_of_records} records" do
        before(:each) do
          (1..number_of_records).each do |_|
            subject.create!(:grouping => 2, :last_updated => now)
          end
        end

        it "has #{number_of_records} rows in the table" do
          subject.count.should == number_of_records
        end

        it 'the last record inserted should be current' do
          subject.last.should == subject.current.first
        end
      end
    end
  end

  # Regardless of the order in which the records are created the result should always be the same
  shared_examples_for 'maintains order' do |number_of_records,last_record_state = :should|
    before(:each) do
      sequence.each do |attributes|
        subject.create!(attributes.merge(:grouping => 2))
      end
    end

    def records
      subject.all(:order => '`from` ASC')
    end

    it "has #{number_of_records} created" do
      subject.count.should == number_of_records
    end

    (1...number_of_records).each do |index|
      it "has the #{index.ordinalize} record as not current" do
        records[index-1].should_not be_current
        records[index-1][:is_current].should_not be_true
      end

      it "has the #{index.ordinalize} record ending at the start of the #{(index+1).ordinalize}" do
        records[index-1].to.should == records[index].from
      end
    end

    it "has the #{number_of_records.ordinalize} as current" do
      records.last.send(last_record_state, be_current)
      records.last[:is_current].send(last_record_state, be_true)
    end
  end

  # Multiple records can turn up in varying number of orders, so we should test them all
  shared_examples_for 'sequence' do |number_of_records, current_state_of_last = :should|
    (1..number_of_records).to_a.permutation.each do |sequence_indexes|
      context "created #{sequence_indexes.to_sentence(:last_word_connector => ' then ')}" do
        it_behaves_like('maintains order', number_of_records, current_state_of_last) do
          let(:sequence) { sequence_indexes.map { |i| ordered_sequence[i-1] } }
        end
      end
    end
  end

  # NOTE: Trying larger numbers will confirm stability but will massively slow down tests!
  [ 2, 3 ].each do |number_of_records|
    context "#{number_of_records} instances" do
      context 'with no deletion' do
        let(:ordered_sequence) do
          (1..number_of_records).map do |i|
            { :last_updated => now + i.hour }
          end
        end

        it_behaves_like('sequence', number_of_records)
      end

      context 'with deletion' do
        let(:ordered_sequence) do
          (1..number_of_records).map do |i|
            { :last_updated => now + i.hour }
          end.tap do |a|
            a.last.merge!(:deleted_at => a.last[:last_updated])
          end
        end

        it_behaves_like('sequence', number_of_records, :should_not)
      end
    end
  end
end
