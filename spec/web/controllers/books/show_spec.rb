RSpec.describe Web::Controllers::Books::Show, type: :action do
  let(:action) { described_class.new }
  let(:repo)   { BookRepository.new }
  let(:book)   { repo.create(title: 'Sample', author: 'John Doe') }

  before { repo.clear }

  context 'with valid params' do
    let(:params)    { Hash[id: book.id] }
    let!(:response) { action.call(params) }

    it 'returns ok' do
      expect(response[0]).to eq(200)
    end

    it 'expose book' do
      expect(action.exposures[:book]).to eq(book)
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[id: book.id + 1] }

    it 'returns not_found' do
      response = action.call(params)

      expect(response[0]).to eq(404)
    end
  end
end
