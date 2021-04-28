RSpec.describe Web::Controllers::Books::Update, type: :action do
  let(:action) { described_class.new }
  let(:repo)   { BookRepository.new }
  let(:book)   { repo.last }
  let(:params) { Hash[id: book.id, book: data] }

  before do
    repo.clear

    repo.create(title: 'Confident Ruby', author: 'Avdi Grimm')
  end

  context 'with valid id' do
    let(:data)   { Hash[title: 'Edited title', author: 'Edited author'] }

    it 'is successful and redirect' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end

    it 'updates database record' do
      action.call(params)

      expect(repo.last.title).to eq('Edited title')
      expect(repo.last.author).to eq('Edited author')
    end
  end

  context 'with invalid id' do
    let(:data)   { Hash[title: '', author: ''] }

    it 'return error' do
      response = action.call(params)

      expect(response[0]).to eq(422)
    end

    it 'does not change database record' do
      action.call(params)

      expect(repo.last.title).to eq('Confident Ruby')
      expect(repo.last.author).to eq('Avdi Grimm')
    end
  end
end
