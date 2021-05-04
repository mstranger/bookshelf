RSpec.describe Web::Controllers::Users::Create, type: :action do
  let(:repo)   { UserRepository.new }
  let(:user)   { Hash[email: 'some@mail.com'] }
  let(:action) { described_class.new }

  before { repo.clear }

  context 'with valid params' do
    let(:params)    { Hash[user: user] }
    let!(:response) { action.call(params) }

    it 'creates a new user' do
      expect(repo.last.id).not_to be_nil
      expect(repo.last.email).to eq(params.dig(:user, :email))
    end

    it 'redirects to the users list' do
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/users')
    end

    it 'has a flash notice' do
      flash = action.exposures[:flash]

      expect(flash[:notice]).to eq('User was created.')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[user: {}] }
    let!(:response) { action.call(params) }

    it 'returns HTTP client error' do
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      errors = action.params.errors

      expect(errors.dig(:user, :email)).to eq(['is missing'])
    end
  end
end
