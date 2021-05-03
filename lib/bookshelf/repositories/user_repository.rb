class UserRepository < Hanami::Repository
  associations do
    has_many :books
  end

  def create_with_books(data)
    assoc(:books).create(data)
  end

  def find_with_books(id)
    aggregate(:books).where(id: id).map_to(User).one
  end

  def add_book(user, data)
    assoc(:books, user).add(data)
  end

  def remove_book(id)
    BookRepository.new.delete(id)
  end

  def books_count(user)
    assoc(:books, user).count
  end
end
