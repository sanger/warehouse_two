shared_examples_for 'has only one row' do
  it 'leaves the system with only one row' do
    described_class.count.should == 1
  end

  it 'ensures that the row is current' do
    described_class.first.tap do |row|
      row.should                  be_current
      row.current_from.should_not be_nil
      row.current_to.should       be_nil
    end
  end

  it 'ensures the row is marked as having been checked' do
    described_class.first.checked_at.should == checked_time_now
  end

  it 'maintains the current view to only one row' do
    current_records.size.should == 1
  end
end

shared_examples_for 'a resource' do
  let(:originally_created_at) { Time.parse('2012-Mar-16 12:06') }
  let(:timestamped_json) { json.merge(:created_at => originally_created_at, :updated_at => originally_created_at) }
  let(:modified_at) { originally_created_at + 1.day }
  let(:checked_time_now) { Time.parse('2012-Mar-06 13:20').utc }

  let(:attributes) { described_class.send(:json).new(timestamped_json) }

  def current_records
    ActiveRecord::Base.connection.select_all("SELECT * FROM current_#{described_class.table_name}")
  end

  context '.create_or_update_from_json' do
    context 'when the record is deleted' do
      before(:each) do
        described_class.stub(:checked_time_now).and_return(checked_time_now)
        described_class.send(:create_or_update, attributes.merge(:deleted_at => Time.now))
      end

      it 'does not add the row to the current view' do
        current_records.should be_empty
      end
    end

    context 'when the record is not current' do
      before(:each) do
        described_class.create_or_update_from_json(timestamped_json)
        described_class.send(:create_or_update, attributes.merge(:last_updated => modified_at - 2.hours))
      end

      it 'only has the current row in the view' do
        current_records.size.should == 1
        current_records.first['current_to'].should be_nil
      end
    end

    context 'when the record is new' do
      before(:each) do
        described_class.stub(:checked_time_now).and_return(checked_time_now)
        described_class.create_or_update_from_json(timestamped_json)
      end

      it_behaves_like 'has only one row'
    end

    context 'when the fields are unchanged' do
      before(:each) do
        described_class.create_or_update_from_json(timestamped_json)
        described_class.stub(:checked_time_now).and_return(checked_time_now)
        described_class.create_or_update_from_json(timestamped_json)
      end

      it_behaves_like 'has only one row'
    end

    context 'when ignored fields change' do
      ResourceTools::IGNOREABLE_ATTRIBUTES.each do |attribute|
        next if attribute.to_s == 'dont_use_id' # Protected by mass-assignment!

        context "when #{attribute.to_sym.inspect} changes" do
          before(:each) do
            # We have to account for attribute translation, so process through the JSON handler
            # and then update the attribute.
            described_class.send(:create_or_update, attributes)
            described_class.stub(:checked_time_now).and_return(checked_time_now)
            attributes[attribute] = 'changed'
            described_class.send(:create_or_update, attributes)
          end

          it_behaves_like 'has only one row'
        end
      end
    end
  end
end
