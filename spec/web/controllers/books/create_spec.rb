RSpec.describe Web::Controllers::Books::Create, type: :action do
  let(:book)   { Hash[title: 'Confident Ruby', author: 'Avdi Grimm'] }
  let(:action) { described_class.new }
  let(:repo)   { BookRepository.new }

  before { repo.clear }

  context 'with valid params' do
    let(:params)    { Hash[book: book] }
    let!(:response) { action.call(params) }

    it 'creates a new book' do
      book = repo.last

      expect(book.id).not_to be_nil
      expect(book.title).to eq(params.dig(:book, :title))
    end

    it 'redirects the user to the books listing' do
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end

    it 'has a flash notice' do
      flash = action.exposures[:flash]

      expect(flash[:notice]).to eq('New book was added.')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[book: {}] }
    let!(:response) { action.call(params) }

    it 'returns HTTP client error' do
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to eq(['is missing'])
      expect(errors.dig(:book, :author)).to eq(['is missing'])
    end
  end
end
