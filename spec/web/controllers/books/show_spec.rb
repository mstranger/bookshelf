RSpec.describe Web::Controllers::Books::Show, type: :action do
  let(:action) { described_class.new }
  let(:repo) { BookRepository.new }

  before do
    repo.clear

    @book = repo.create(title: 'Sample', author: 'John Doe')
  end

  context 'with valid params' do
    let(:params) { Hash[id: @book.id]}

    it 'returns ok' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end

    it 'expose book' do
      action.call(params)
      expect(action.exposures[:book]).to eq(@book)
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[id: @book.id + 1] }

    it 'returns not_found' do
      response = action.call(params)
      expect(response[0]).to eq(404)
    end
  end
end
