require 'features_helper'

RSpec.describe 'Add a book', type: :feature do
  let(:user) { UserRepository.new.create(email: 'some@mail.com') }

  before { UserRepository.new.clear }

  after  { BookRepository.new.clear }

  it 'can create a new book' do
    user
    visit '/books/new'

    expect(page).not_to have_content('Create User first...')

    within 'form#book-form' do
      fill_in 'Title',  with: 'Example book'
      fill_in 'Author', with: 'Some author'
      select user.email, from: 'book-user-id'

      click_button 'Create'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('Example book')
    expect(page).to have_content('New book was added')
  end

  it 'displays list of errors when params contains errors' do
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create'
    end

    expect(page).to have_current_path('/books')

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Title must be filled')
    expect(page).to have_content('Author must be filled')
    expect(page).to have_content('User Id must be filled')
  end

  it 'display message if no users' do
    visit '/books/new'

    expect(page).to have_content('Create User first...')
  end
end
