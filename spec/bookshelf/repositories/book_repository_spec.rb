RSpec.describe BookRepository, type: :repository do
  let(:book_repo) { described_class.new }
  let(:user_repo) { UserRepository.new }
  let(:user)      { user_repo.create(email: 'some@mail.com') }
  let(:book)      { book_repo.create(user_id: user.id, title: 'sample', author: 'john doe') }

  before do
    book_repo.clear
    user_repo.clear
    book
  end

  it 'creates new book' do
    expect(book_repo.last).to eq(book)
  end

  it 'belongs to user' do
    expect(book).to respond_to(:user)
  end

  it 'find book by user id' do
    expect(book_repo.find_with_user(user.id)).to eq(book)
  end

  it 'cannot create book without user' do
    expect {
      book_repo.create(title: 'other', author: 'example')
    }.to raise_error(Hanami::Model::NotNullConstraintViolationError)
  end
end
