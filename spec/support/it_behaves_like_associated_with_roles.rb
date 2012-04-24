shared_examples_for 'maintains roles correctly' do
  after(:each) do
    described_class.create_or_update_from_json(timestamped_json.merge(updated_roles).merge(:updated_at => updated_at))
    users_fit_exactly(expected_roles)
  end

  it 'add new users' do
    updated_roles[:manager].push(user_with_role(:manager, 'new'))
  end

  it 'remove users who have been removed' do
    updated_roles[:manager].shift
  end
end

shared_examples_for 'associated with roles' do
  def user_with_role(role, index = nil)
    suffix = " #{index}" unless index.nil?
    { :name => "#{role} name#{suffix}", :email => "#{role} email#{suffix}", :login => "#{role} login#{suffix}" }
  end

  def users_fit_exactly(roles)
    described_class::User.count.should == roles.values.flatten.size

    roles.each do |role, expected|
      found = described_class::User.all(:conditions => { :role => role.to_s }).map do |user|
        Hash[[:name, :email, :login].map { |a| [a,user[a]] }]
      end
      found.should == expected
    end
  end

  let(:originally_created_at) { Time.parse('2012-Mar-16 12:06') }
  let(:timestamped_json) { json.merge(:created_at => originally_created_at, :updated_at => originally_created_at) }

  context 'for an existing record' do
    let(:roles)         { { :manager => [ user_with_role(:manager, 1), user_with_role(:manager, 2) ] } }
    let(:updated_roles) { { :manager => [ user_with_role(:manager, 1), user_with_role(:manager, 2) ] } }

    before(:each) do
      described_class.create_or_update_from_json(timestamped_json.merge(roles))
    end

    context 'where the update is classed current it does' do
      let(:updated_at) { originally_created_at + 1.day }
      let(:expected_roles) { updated_roles }
      it_behaves_like 'maintains roles correctly'
    end

    context 'where the update is legacy does not' do
      let(:updated_at) { originally_created_at - 1.day }
      let(:expected_roles) { roles }
      it_behaves_like 'maintains roles correctly'
    end
  end

  context 'for new record' do
    let(:roles) { Hash[[ :manager, :follower, :administrator ].map { |role| [role,[user_with_role(role)]] }] }

    before(:each) do
      described_class.create_or_update_from_json(timestamped_json.merge(roles))
    end

    it 'maintains users' do
      users_fit_exactly(roles)
    end
  end
end
