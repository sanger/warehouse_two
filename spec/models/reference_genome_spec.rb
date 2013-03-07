require 'spec_helper'

describe ReferenceGenome do
  it_behaves_like 'a resource'

  let(:json) do
    {
      :uuid                  => '11111111-2222-3333-4444-555555555555',
      :internal_id           => 1,
      :name                  => 'Human',
      :updated_at            => '2012-Mar-06 11:35:00',
      :created_at            => '2012-Mar-06 11:35:00'
    }
  end
end
