RSpec.describe Web::Controllers::Books::Index, type: :action do
  let(:action) { described_class.new }
  let(:repo)   { BookRepository.new }
  let(:user)   { UserRepository.new.create(email: 'some@mail.com') }
  let(:book)   { repo.create(user_id: user.id, title: 'TDD', author: 'Keng Beck') }
  let(:params) { Hash[] }

  before do
    repo.clear
    book
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all books' do
    action.call(params)
    expect(action.exposures[:books]).to eq([book])
  end
end
