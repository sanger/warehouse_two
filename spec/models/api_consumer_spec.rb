require 'spec_helper'

describe ApiConsumer do
  let(:model) do
    mock(:model).tap do |model|
      model.stub(:name).and_return('ModelName')
    end
  end

  before(:all) do
    Mocktra('www.example.com') do
      [ '11111111-2222-3333-4444-555555555555', '22222222-3333-4444-5555-666666666666' ].each do |uuid|
        get "/api/model_names/#{uuid}" do
          %Q{{"model_name":"attributes for #{uuid}"}}
        end
      end

      get '/api/model_names' do
        page = params[:page] || 'unspecified'
        if page == '102'
          %Q{[]}
        else
          %Q{[{"model_name": "page #{page}"}]}
        end
      end
    end
  end

  subject { ApiConsumer.new(model) }

  let(:callback) { mock(:callback) }

  context '#for_uuid' do
    it 'retrieves a single UUID' do
      object = mock(:object)
      model.should_receive(:create_or_update_from_json).with("attributes for 11111111-2222-3333-4444-555555555555").and_return(object)
      callback.should_receive(:call).with(object)

      subject.for_uuid('11111111-2222-3333-4444-555555555555').each(&callback.method(:call))
    end

    it 'retrieves multiple UUIDs' do
      object1, object2 = mock(:object1), mock(:object2)
      model.should_receive(:create_or_update_from_json).with("attributes for 11111111-2222-3333-4444-555555555555").and_return(object1)
      model.should_receive(:create_or_update_from_json).with("attributes for 22222222-3333-4444-5555-666666666666").and_return(object2)
      callback.should_receive(:call).with(object1)
      callback.should_receive(:call).with(object2)

      subject.for_uuid('11111111-2222-3333-4444-555555555555', '22222222-3333-4444-5555-666666666666').each(&callback.method(:call))
    end

    it 'raises when the UUID does not exist' do
      callback.should_receive(:call).never

      expect do
        subject.for_uuid('99999999-0000-1111-2222-333333333333').each(&callback.method(:call))
      end.to raise_error(described_class::ResourceNotFound)
    end
  end

  context '#each_page' do
    context 'specified pages' do
      after(:each) do
        @pages.each do |page|
          object = mock("page #{page}")
          model.should_receive(:create_or_update_from_json).with("page #{page}").and_return(object)
          callback.should_receive(:call).with([object], page)
        end

        subject.each_page(@pages, &callback.method(:call))
      end

      it 'retrieves the specified page' do
        @pages = [42]
      end

      it 'retrieves the specified multiple pages' do
        @pages = [ 42, 12, 55 ]
      end

      it 'retrieves ranges of pages' do
        @pages = (1..5)
      end
    end

    it 'retrieves infinite ranges' do
      object1, object2 = mock("page 100"), mock("page 101")
      model.should_receive(:create_or_update_from_json).with("page 100").and_return(object1)
      model.should_receive(:create_or_update_from_json).with("page 101").and_return(object2)
      callback.should_receive(:call).with([object1], 100)
      callback.should_receive(:call).with([object2], 101)

      subject.each_page(described_class::InfiniteSequence.new(100), &callback.method(:call))
    end
  end

  context '#each' do
    it 'delegates to #each_page' do
      subject.should_receive(:each_page).and_yield([1,2,3,4], 1)
      callback.should_receive(:call).with(1)
      callback.should_receive(:call).with(2)
      callback.should_receive(:call).with(3)
      callback.should_receive(:call).with(4)

      subject.each(&callback.method(:call))
    end
  end
end
