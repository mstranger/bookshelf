require 'features_helper'

RSpec.describe 'Visit book page that does not exsit', type: :feature do
  let(:user) { UserRepository.new.create(email: 'some@mail.com') }
  let(:repo) { BookRepository.new }
  let(:book) { repo.last }

  before do
    repo.clear

    repo.create(user_id: user.id, title: 'TDD', author: 'Kent Beck')
  end

  it 'diplays each book on the page' do
    visit "/books/#{book.id + 1}"

    expect(page).to have_content('Not Found')
  end
end
