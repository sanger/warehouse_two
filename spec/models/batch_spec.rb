require 'spec_helper'

describe Batch do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id

  let(:json) do
    {
      :uuid                 => '11111111-2222-3333-4444-555555555555',
      :id                   => 1,
      :created_by           => 'created by',
      :assigned_to          => 'assigned to',
      :pipeline_name        => 'pipeline name',
      :pipeline_uuid        => '22222222-3333-4444-5555-666666666666',
      :pipeline_internal_id => 2,
      :state                => 'state',
      :qc_state             => 'qc state',
      :production_state     => 'production state'
    }
  end
end
