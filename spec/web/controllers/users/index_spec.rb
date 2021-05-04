RSpec.describe Web::Controllers::Users::Index, type: :action do
  let(:action)   { described_class.new }
  let(:repo)     { UserRepository.new }
  let(:user)     { repo.create(email: 'some@mail.com') }
  let(:params )  { Hash[] }
  let(:response) { action.call(params) }

  before do
    repo.clear
    user
  end

  it 'is successful' do
    expect(response[0]).to eq 200
  end

  it 'exposes all users' do
    response
    expect(action.exposures[:users]).to eq([user])
  end
end
