require 'features_helper'

RSpec.describe 'Delete a book' do
  let(:repo) { BookRepository.new }

  before do
    repo.clear
    
    repo.create(title: 'TDD', author: 'Kent Beck')
  end

  it 'removes the given book' do
    visit '/books'

    within 'form#book-form' do
      click_button 'Delete'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('There are no books yet.')
  end
end
