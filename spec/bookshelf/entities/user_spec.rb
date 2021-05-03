RSpec.describe User, type: :entity do
  it 'can be initialized with attributes' do
    user = described_class.new(email: 'some@mail.com')

    expect(user.email).to eq('some@mail.com')
  end
end
