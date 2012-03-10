shared_examples_for 'maps JSON fields' do |mapped_attributes|
  describe described_class::Json do
    subject { described_class::Json.new(json) }

    mapped_attributes.each do |from, to|
      it "maps #{from.inspect} to #{to.inspect}" do
        subject[to].should == json[from]
      end
    end
  end
end
