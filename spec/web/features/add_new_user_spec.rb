require 'features_helper'

RSpec.describe 'Add a new user', type: :feature do
  let(:user) { Hash[email: 'some@mail.com'] }

  after { UserRepository.new.clear }

  it 'can create a new user' do
    visit '/users/new'

    within 'form#user-form' do
      fill_in 'Email', with: user[:email]

      click_button 'Create User'
    end

    expect(page).to have_current_path('/users')
    expect(page).to have_content(user[:email])
  end

  it 'displays list of errors when params invalid' do
    visit '/users/new'

    within 'form#user-form' do
      click_button 'Create User'
    end

    expect(page).to have_current_path('/users')

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Email must be filled')
  end
end
