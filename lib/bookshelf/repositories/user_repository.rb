class UserRepository < Hanami::Repository
  associations do
    has_many :books
  end

  def create_with_books(data)
    assoc(:books).create(data)
  end

  def find_with_books(id)
    aggregate(:books).where(id: id).as(User).one
  end

  def add_book(user, data)
    assoc(:books, user).add(data)
  end

  def remove_book(user, id)
    assoc(:books, user).remove(id)
  end

  def books_count(author)
    assoc(:books, author).count
  end
end
