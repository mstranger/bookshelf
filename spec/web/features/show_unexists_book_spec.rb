require 'features_helper'

RSpec.describe 'Visit book page that does not exsit' do
  let(:repo) { BookRepository.new }
  let(:book) { repo.last }

  before do
    repo.clear

    repo.create(title: 'TDD', author: 'Kent Beck')
  end

  it 'diplays each book on the page' do
    visit "/books/#{book.id + 1}"

    expect(page).to have_content('Not Found')
  end
end
