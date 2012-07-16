shared_examples_for 'it is ignored' do
  subject { described_class.create_or_update_from_json }

  context '#inserted_record?' do
    it 'is always true' do
      subject.should_not be_inserted_record
    end
  end

  context '#id' do
    it 'is ignored' do
      subject.id.should == 'ignored'
    end
  end
end
