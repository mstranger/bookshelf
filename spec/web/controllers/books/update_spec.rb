RSpec.describe Web::Controllers::Books::Update, type: :action do
  let(:action) { described_class.new }
  let(:repo)   { BookRepository.new }

  before do
    repo.clear

    repo.create(title: 'Confident Ruby', author: 'Avdi Grimm')
  end

  xcontext 'with valid id' do
    let(:book) { repo.last }
    let(:data) { Hash[title: book.title, author: book.author] }
    let(:params) { Hash[id: 12] }

    it 'is successful' do
      response = action.call(params)
      expect(response[0]).to eq 200
    end
  end
end
