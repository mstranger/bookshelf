require 'features_helper'

RSpec.describe 'List books', type: :feature do
  let(:repo) { BookRepository.new }
  let(:user) { UserRepository.new.create(email: 'some@mail.com') }

  before do
    repo.clear

    repo.create(user_id: user.id, title: 'PoEAA', author: 'Martin Fowler')
    repo.create(user_id: user.id, title: 'TDD', author: 'Kent Beck')
  end

  it 'diplays each book on the page' do
    visit '/books'

    within '#books' do
      expect(page).to have_selector('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
