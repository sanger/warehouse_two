require 'spec_helper'

describe Order do
  it_behaves_like 'a resource'
  it_behaves_like 'ignores JSON fields', [
    :submission_internal_id,
    :project_internal_id,
    :study_internal_id
  ]

  context 'remapping request options' do
    subject { described_class.new(described_class.send(:json).new(json)) }

    described_class::REMAPPING_OPTIONS.each do |json_attribute, attribute|
      arrayed = Array(json_attribute)

      it "it maps #{arrayed.join('.')} to #{attribute.inspect}" do
        subject[attribute].should == arrayed.inject(json[:request_options]) { |j,k| j[k.to_sym] }
      end
    end
  end

  let(:json) do
    {
      :uuid            => "11111111-2222-3333-4444-555555555555",
      :internal_id     => 1,
      :updated_at      => "2012-03-12 09:34:32",
      :created_at      => "2012-03-12 09:34:32",
      :created_by      => "created by",
      :template_name   => "template name",
      :study_name      => "study name",
      :study_uuid      => "22222222-3333-4444-5555-666666666666",
      :project_name    => "project name",
      :project_uuid    => "33333333-4444-5555-6666-777777777777",
      :comments        => "comments",
      :submission_uuid => "44444444-5555-6666-7777-888888888888",
      :asset_uuids     => [ "55555555-6666-7777-8888-999999999999", "66666666-7777-8888-9999-000000000000" ],
      :request_options => {
        :read_length            => 2,
        :library_type           => "library type",
        :sequencing_type        => "sequencing type",
        :insert_size            => 3,
        :number_of_lanes        => 4,
        :fragment_size_required => {
          :from => "fragment size required from",
          :to   => "fragment size required to"
        }
      }
    }
  end

  context 'maintains submitted assets' do
    before(:each) do
      described_class.create_or_update_from_json(json)
    end

    it 'records the submitted assets' do
      SubmittedAsset.for_order_uuid('11111111-2222-3333-4444-555555555555').map(&:asset_uuid).sort.should == json[:asset_uuids].sort
    end

    it 'does not change them if they have not changed' do
      described_class.create_or_update_from_json(json)
      SubmittedAsset.for_order_uuid('11111111-2222-3333-4444-555555555555').map(&:asset_uuid).sort.should == json[:asset_uuids].sort
    end

    context 'and changes them' do
      after(:each) do
        described_class.create_or_update_from_json(
          json.dup.merge(:asset_uuids => @asset_uuids, :updated_at => '2012-03-12 09:35:00')
        )

        described_class.count.should == 2
        SubmittedAsset.for_order_uuid('11111111-2222-3333-4444-555555555555').map(&:asset_uuid).sort.should == @asset_uuids.sort
      end

      it 'when a new asset is added' do
        @asset_uuids = json[:asset_uuids].dup << '77777777-8888-9999-0000-111111111111'
      end

      it 'when an asset is removed' do
        @asset_uuids = json[:asset_uuids].dup
        @asset_uuids.shift
      end

      it 'when they change' do
        @asset_uuids = [ '99999999-0000-1111-2222-000000000001', '99999999-0000-1111-2222-000000000002' ]
      end
    end
  end
end
