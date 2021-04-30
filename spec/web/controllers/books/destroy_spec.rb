RSpec.describe Web::Controllers::Books::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:repo)   { BookRepository.new }
  let(:book)   { repo.create(title: 'TDD', author: 'Keng Beck') }

  before { repo.clear }

  context 'with valid id' do
    let(:params) { Hash[id: book.id] }

    it 'deletes a book from repository' do
      action.call(params)

      expect(repo.all.count).to eq(0)
    end

    it 'redirects to the books listing' do
      response = action.call(id: book.id)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end

    it 'has a flash notice' do
      action.call(params)
      flash = action.exposures[:flash]
      expect(flash[:notice]).to eq('Book was deleted.')
    end
  end

  context 'with invalid id' do
    let(:params) { Hash[id: book.id + 1] }

    it 'returns client errors' do
      response = action.call(params)

      expect(response[0]).to eq(422)
    end
  end
end
