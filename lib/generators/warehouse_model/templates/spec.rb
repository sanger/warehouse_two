require 'spec_helper'

describe <%= singular_name.classify %> do
  it_behaves_like 'a resource'

  # TODO: Uncomment and adjust for field mappings
#  it_behaves_like 'maps JSON fields', :id => :internal_id

  let(:json) do
    {
      <%= columns.map { |n,v| "#{n.to_sym.inspect} => #{v.inspect}" }.join(",\n") %>
    }
  end
end
