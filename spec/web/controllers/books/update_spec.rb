RSpec.describe Web::Controllers::Books::Update, type: :action do
  let(:user)   { UserRepository.new.create(email: 'some@mail.com') }
  let(:action) { described_class.new }
  let(:repo)   { BookRepository.new }
  let(:book)   { Hash[title: 'Confident Ruby', author: 'Avdi Grimm'] }
  let(:params) { Hash[id: repo.last.id, book: data] }

  before do
    repo.clear
    repo.create(book.merge(user_id: user.id))
  end

  context 'with valid id' do
    let(:data)      { Hash[user_id: user.id, title: 'Edited title', author: 'Edited author'] }
    let!(:response) { action.call(params) }

    it 'is successful and redirect' do
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end

    it 'updates database record' do
      expect(repo.last.title).to eq('Edited title')
      expect(repo.last.author).to eq('Edited author')
    end

    it 'has a flash notice' do
      flash = action.exposures[:flash]

      expect(flash[:notice]).to eq('Book was updated.')
    end
  end

  context 'with invalid id' do
    let(:data)      { Hash[title: '', author: ''] }
    let!(:response) { action.call(params) }

    it 'return error' do
      expect(response[0]).to eq(422)
    end

    it 'does not change database record' do
      expect(repo.last.title).to eq(book[:title])
      expect(repo.last.author).to eq(book[:author])
    end

    it 'dumps errors in params' do
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to eq(['must be filled'])
      expect(errors.dig(:book, :author)).to eq(['must be filled'])
      expect(errors.dig(:book, :user_id)).to eq(['is missing'])
    end
  end
end
