RSpec.describe Web::Controllers::Books::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repo) { BookRepository.new }
  let(:book) { repo.create(title: 'TDD', author: 'Keng Beck') }

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
