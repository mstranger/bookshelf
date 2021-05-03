class BookRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def find_with_user(id)
    aggregate(:user).where(user_id: id).map_to(Book).one
  end
end
