require 'features_helper'

RSpec.describe 'Display correct title for', type: :feature do
  let(:user) { UserRepository.new.create(email: 'some@mail.com') }

  it 'root page' do
    visit '/'
    expect(page).to have_title('Bookshelf')
  end

  it 'books page' do
    visit '/books'
    expect(page).to have_title('Bookshelf | All books')
  end

  it 'new book page' do
    visit '/books/new'
    expect(page).to have_title('Bookshelf | New book')
  end

  it 'show book page' do
    book = BookRepository.new.create(user_id: user.id, title: 'Sample', author: 'John Doe')
    visit "/books/#{book.id}"
    expect(page).to have_title('Bookshelf | Book info')
  end

  it 'edit book page' do
    book = BookRepository.new.create(user_id: user.id, title: 'Sample', author: 'John Doe')
    visit "/books/#{book.id}/edit"
    expect(page).to have_title('Bookshelf | Edit book')
  end
end
