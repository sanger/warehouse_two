require 'spec_helper'

describe PulldownMultiplexedLibraryTube do
  it 'is an extension of MultiplexedLibraryTube' do
    described_class.superclass.should == MultiplexedLibraryTube
  end
end
