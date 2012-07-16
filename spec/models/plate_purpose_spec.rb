require 'spec_helper'

describe PlatePurpose do
  it_behaves_like 'a resource'

  let(:json) do
    {
      :uuid        => "22222222-3333-4444-5555-666666666666",
      :internal_id => 2,
      :name        => "name",
      :updated_at  => "2012-03-11 10:16:43",
      :created_at  => "2012-03-11 10:16:43"
    }
  end
end
