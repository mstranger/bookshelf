require 'features_helper'

RSpec.describe 'Update a book' do
  let(:repo) { BookRepository.new }
  let(:book) { repo.last }

  before do
    repo.clear

    repo.create(title: 'TDD', author: 'Kent Beck')
  end

  context 'with valid data' do
    it 'updates attributes' do
      visit "/books/#{book.id}/edit"

      within 'form#book-form' do
        fill_in 'Title',  with: 'Edited title'
        fill_in 'Author', with: 'Edited author'
        click_button 'Update Book'
      end

      expect(page).to have_current_path('/books')
      expect(page).to have_content('Edited title')
      expect(page).to have_content('Edited author')
    end
  end

  context 'with invalid data' do
    it 'returns error messages' do
      visit "/books/#{book.id}/edit"

      within 'form#book-form' do
        fill_in 'Title',  with: ''
        fill_in 'Author', with: ''
        click_button 'Update Book'
      end

      expect(page).to have_current_path("/books/#{book.id}")
      expect(page).to have_content('Title must be filled')
      expect(page).to have_content('Author must be filled')
      expect(page).to have_content('There was a problem with your submission')
    end
  end
end
