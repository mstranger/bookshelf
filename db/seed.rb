### seed.rb file
### Examples

## Create only user
# UserRepository.new.create(email: 'jdoe@mail.com')

## Create user with books
# user_repo = UserRepository.new
# user1 = 'jdoe@mail.com'
# book1 = { title: 'Confident Ruby', author: 'Avdi Grimm' }
# book2 = { title: 'Everyday Rails Testing with RSpec', author: 'Aaron Sumner' }
# user_repo.create_with_books(email: user1, books: [book1, book2])

## Create only book
# book_repo = BookRepository.new
# book_repo.create(
#   user_id: user_repo.last.id,
#   author: 'book author',
#   title: 'book title'
# )
