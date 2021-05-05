require 'features_helper'

RSpec.describe 'List users', type: :feature do
  it 'is successful' do
    visit '/users'

    expect(page).to have_current_path('/users')
    expect(page).to have_link('Add new user')
  end
end
