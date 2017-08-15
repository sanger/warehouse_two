require 'spec_helper'

describe ResourceTools::Json::Handler do
  class Json < ResourceTools::Json::Handler
    whitelist('key_a', :key_b, 'key_c')
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

  context 'ignores keys that are not whitelisted or translated' do
    subject { Json.new('key_a' => 'a', 'key_b' => 'b', 'key_c' => 'c', 'key_d' => 'd', 'key_e' => 'e') }

    it 'ignores keys on construction' do
      subject.should_not have_key('key_d')
      subject.should_not have_key('key_e')
      subject.should_not have_key('ignored')
    end

    it 'should not ignore translations' do
      subject['key'] = 'value'
      subject.should have_key('translated')
    end

  end 
end
