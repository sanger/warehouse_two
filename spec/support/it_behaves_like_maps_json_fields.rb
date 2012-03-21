shared_examples_for 'maps JSON fields' do |mapped_attributes|
  let!(:json_handler) { described_class.send(:json) }

  describe described_class.send(:json) do
    subject { json_handler.new(json) }

    mapped_attributes.each do |from, to|
      it "maps #{from.inspect} to #{to.inspect}" do
        subject[to].should == json[from]
      end
    end
  end
end

shared_examples_for 'ignores JSON fields' do |ignored_attributes|
  let!(:json_handler) { described_class.send(:json) }

  describe described_class.send(:json) do
    ignored_attributes.each do |name|
      it "ignores #{name.inspect}" do
        json_handler.new(json.merge(name => 'ignored')).should_not have_key(name)
      end
    end
  end
end
