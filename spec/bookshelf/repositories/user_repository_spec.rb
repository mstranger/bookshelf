RSpec.describe UserRepository, type: :repository do
  let(:user_repo) { described_class.new }
  let(:book_repo) { BookRepository.new }
  let(:user)      { Hash[email: 'some@mail.com'] }
  let(:book1)     { Hash[title: 'sample1', author: 'john doe'] }
  let(:book2)     { Hash[title: 'sample2', author: 'john smith'] }

  before do
    book_repo.clear
    user_repo.clear

    user_repo.create_with_books(email: user[:email], books: [book1, book2])
  end

  it 'create user and books' do
    expect(user_repo.last.email).to eq(user[:email])
    expect(book_repo.all.count).to eq(2)
  end

  it 'has many books' do
    expect(user_repo.last).to respond_to(:books)
  end

  it '#find_with_books' do
    u = user_repo.find_with_books(user_repo.last.id)
    titles = [book1[:title], book2[:title]]

    expect(u.email).to eq(user[:email])
    expect(u.books.map(&:title)).to eq(titles)
  end

  it '#books_count' do
    expect(user_repo.books_count(user_repo.last)).to eq(2)
  end

  it '#add_book' do
    book3 = Hash[title: 'sample3', author: 'jane smith']
    user_repo.add_book(user_repo.last, book3)

    expect(user_repo.books_count(user_repo.last)).to eq(3)
  end

  it '#remove_book' do
    user_repo.remove_book(book_repo.last.id)

    expect(user_repo.books_count(user_repo.last)).to eq(1)
  end
end
