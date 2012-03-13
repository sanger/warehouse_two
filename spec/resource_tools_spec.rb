require 'spec_helper'

describe 'core extensions' do
  describe NilClass do
    context '#check' do
      let(:callback) do
        mock(:callback).tap do |callback|
          callback.should_receive(:call)
        end
      end

      it 'yields if the value is nil' do
        nil.check(nil, &callback.method(:call))
      end

      it 'yields if the value is not nil' do
        nil.check('value', &callback.method(:call))
      end
    end
  end

  describe Hash do
    subject { { :a => 1, :b => 2 } }

    context '#within_acceptable_bounds?' do
      it 'returns true if all values are within acceptable bounds' do
        subject.within_acceptable_bounds?(:a => 1, :b => 2).should be_true
      end

      it 'returns true if all present values are within acceptable bounds' do
        subject.within_acceptable_bounds?(:a => 1).should be_true
        subject.within_acceptable_bounds?(:b => 2).should be_true
      end

      it 'returns false if a single value is not within acceptable bounds' do
        subject.within_acceptable_bounds?(:a => 5, :b => 2).should be_false
        subject.within_acceptable_bounds?(:a => 1, :b => 5).should be_false
      end
    end

    context '#reverse_slice' do
      it 'returns a hash without the specified keys' do
        subject.reverse_slice(:b).should == { :a => 1 }
      end

      it 'does not affect the original hash' do
        subject.reverse_slice(:b)
        subject.should == { :a => 1, :b => 2 }
      end
    end
  end

  describe Object do
    subject { Object.new }

    context '#within_acceptable_bounds?' do
      it 'returns false if the object is not equal' do
        subject.within_acceptable_bounds?(Object.new).should be_false
      end

      it 'returns true if the object is equal' do
        subject.within_acceptable_bounds?(subject).should be_true
      end
    end
  end

  describe String do
    subject { 'value' }

    context '#within_acceptable_bounds?' do
      it 'returns false if the value is nil' do
        subject.within_acceptable_bounds?(nil).should be_false
      end

      it 'returns false if the string value is not equal' do
        subject.within_acceptable_bounds?('different').should be_false
      end

      it 'returns true if the string value is equal' do
        subject.within_acceptable_bounds?('value').should be_true
      end

      it 'returns true if the value is equal when converted to a string' do
        object = Object.new.tap do |object|
          def object.to_s
            'value'
          end
        end
        subject.within_acceptable_bounds?(object).should be_true
      end
    end
  end

  describe Numeric do
    context '#within_acceptable_bounds?' do
      subject { 1.0 }

      # Values that should be acceptable.  Note that we have a small adjustment to the tolerance
      # so that we actually get within it, otherwise we're just in the situation where we're
      # trying to compare floats ... which means deltas ... which means tolerance ...
      let(:bounds) do
        tolerance_adjustment = configatron.numeric_tolerance - 1.0e-15
        (subject-tolerance_adjustment .. subject+tolerance_adjustment)
      end

      it 'returns false if the value is nil' do
        subject.within_acceptable_bounds?(nil).should be_false
      end

      it 'returns true if the value is within the upper bounds' do
        subject.within_acceptable_bounds?(bounds.last).should be_true
      end

      it 'returns true if the value is within the lower bounds' do
        subject.within_acceptable_bounds?(bounds.first).should be_true
      end

      it 'returns false if the value is above the upper bounds' do
        subject.within_acceptable_bounds?(bounds.last + 0.00001).should be_false
      end

      it 'returns false if the value is below the lower bounds' do
        subject.within_acceptable_bounds?(bounds.first - 0.00001).should be_false
      end
    end
  end
end

describe ResourceTools::Json do
  class Json < ResourceTools::Json
    ignore('ignored')
    translate('key' => 'translated')
  end

  context 'supports translations' do
    subject { Json.new }

    it 'does not translate keys by default' do
      subject['key'] = 'value'
      subject.should have_key('key')
    end

    it 'can translate keys' do
      subject['key'] = 'value'
      subject.should have_key('translated')
    end

    it 'translates updated_at to last_updated' do
      subject['updated_at'] = 'date'
      subject['last_updated'].should == 'date'
    end

    it 'translates created_at to created' do
      subject['created_at'] = 'date'
      subject['created'].should == 'date'
    end
  end

  context 'ignores keys' do
    subject { Json.new('ignored' => 'value') }

    it 'ignores keys on construction' do
      subject.should_not have_key('ignored')
    end
  end
end
