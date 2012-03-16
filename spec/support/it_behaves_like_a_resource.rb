shared_examples_for 'has only one row' do
  let(:checked_time_now) { Time.parse('2012-Mar-06 13:20').utc }

  it 'leaves the system with only one row' do
    described_class.count.should == 1
  end

  it 'ensures that the row is current' do
    described_class.first.tap do |row|
      row.is_current.should       be_true
      row.current_from.should_not be_nil
      row.current_to.should       be_nil
    end
  end

  it 'ensures the row is marked as having been checked' do
    described_class.first.checked_at.should == checked_time_now
  end
end

shared_examples_for 'maintains history' do |*args|
  has_no_current_rows = args.first

  let(:modified_at) { Time.parse('2012-Mar-06 11:41:00') }
  let(:current_row) { has_no_current_rows ? described_class.last : described_class.current.first }

  it 'adds a new row' do
    described_class.count.should == 2
  end

  unless has_no_current_rows
    it 'leaves only one row as current' do
      described_class.current.count.should == 1
      described_class.current.first.tap do |row|
        row.is_current.should       be_true
        row.current_from.should_not be_nil
        row.current_to.should       be_nil
      end
    end

    it 'ensures that the current row is the most recent' do
      described_class.current.first.last_updated.utc.should == modified_at.utc
    end
  end

  it 'ensures rows are marked as not current' do
    described_class.not_current.each do |row|
      row.is_current.should       be_false
      row.current_from.should_not be_nil
      row.current_to.utc.should == current_row.last_updated.utc
    end
  end
end

shared_examples_for 'a resource' do
  let(:originally_created_at) { Time.parse('2012-Mar-16 12:06') }
  let(:timestamped_json) { json.merge(:created_at => originally_created_at, :updated_at => originally_created_at) }

  context '.create_or_update_from_json' do
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
            attributes = described_class::Json.new(timestamped_json)
            described_class.send(:create_or_update, attributes)
            described_class.stub(:checked_time_now).and_return(checked_time_now)
            attributes[attribute] = 'changed'
            described_class.send(:create_or_update, attributes)
          end

          it_behaves_like 'has only one row'
        end
      end
    end

    context 'when a field changes' do
      before(:each) do
        described_class.create_or_update_from_json(timestamped_json)
        described_class.create_or_update_from_json(timestamped_json.merge(:updated_at => modified_at))
      end

      it_behaves_like 'maintains history'
    end

    context 'when a record is deleted' do
      before(:each) do
        described_class.create_or_update_from_json(timestamped_json)
        described_class.create_or_update_from_json(timestamped_json.merge(:deleted_at => modified_at))
      end

      it_behaves_like 'maintains history', :no_current_rows
    end
  end
end
