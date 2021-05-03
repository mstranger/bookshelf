require 'features_helper'

RSpec.describe 'Delete a book', type: :feature do
  let(:user) { UserRepository.new.create(email: 'some@mail.com') }
  let(:repo) { BookRepository.new }

  before do
    repo.clear

    repo.create(user_id: user.id, title: 'TDD', author: 'Kent Beck')
  end

  it 'removes the given book' do
    visit '/books'

    within 'form#book-form' do
      click_button 'Delete'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('There are no books yet.')
    expect(page).to have_content('Book was deleted')
  end
end
