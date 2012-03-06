shared_examples_for 'maps JSON fields' do |mapped_attributes|
  describe described_class::Json do
    subject { described_class.new(json) }

    mapped_attributes.stringify_keys.each do |from, to|
      it "maps #{from.inspect} to #{to.inspect}" do
        subject[to].should == json[from]
      end
    end
  end
end
