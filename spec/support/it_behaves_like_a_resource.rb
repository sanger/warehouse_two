shared_examples_for 'a resource' do
  context '.create_or_update_from_json' do
    context 'when the record is new' do
      it 'creates a new row' do
        described_class.create_or_update_from_json(json)
        described_class.count.should == 1
      end
    end

    context 'when the fields are unchanged' do
      let(:checked_time_now) { Time.parse('2012-Mar-06 13:20') }

      before(:each) do
        described_class.create_or_update_from_json(json)
        described_class.stub(:checked_time_now).and_return(checked_time_now)
        described_class.create_or_update_from_json(json)
      end

      it 'does not add a new row' do
        described_class.count.should == 1
      end

      it 'marks the existing record as checked' do
        described_class.first.checked_at.should == checked_time_now.utc
      end
    end

    context 'when ignored fields change' do
      ResourceTools::IGNOREABLE_ATTRIBUTES.each do |attribute|
        context "when #{attribute.to_sym.inspect} changes" do
          let(:checked_time_now) { Time.parse('2012-Mar-06 13:20') }

          before(:each) do
            described_class.create_or_update_from_json(json)
            described_class.stub(:checked_time_now).and_return(checked_time_now)
            described_class.create_or_update_from_json(json.merge(attribute => 'changed'))
          end

          it 'does not add a new row' do
            described_class.count.should == 1
          end

          it 'marks the existing record as checked' do
            described_class.first.checked_at.should == checked_time_now.utc
          end
        end
      end
    end

    context 'when a field changes' do
      let(:updated_at) { Time.parse('2012-Mar-06 11:38:00') }

      before(:each) do
        described_class.create_or_update_from_json(json)
        described_class.create_or_update_from_json(json.merge(:updated_at => updated_at))
      end

      it 'adds a new row' do
        described_class.count.should == 2
      end

      it 'ensures that the current row is the most recent' do
        described_class.current.count.should == 1
        described_class.current.first.last_updated.utc.should == updated_at.utc
      end
    end

    context 'when a record is deleted' do
      let(:deleted_at) { Time.parse('2012-Mar-06 11:41:00') }

      before(:each) do
        described_class.create_or_update_from_json(json)
        described_class.create_or_update_from_json(json.merge(:deleted_at => deleted_at))
      end

      it 'adds a new row' do
        described_class.count.should == 2
      end

      it 'ensures that there are no current rows' do
        described_class.current.count.should == 0
      end
    end
  end
end
