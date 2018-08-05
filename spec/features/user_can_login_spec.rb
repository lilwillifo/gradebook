require 'rails_helper'

describe 'User' do

  scenario 'can login and go to dashboard' do
    user = create(:student)

    visit root_path
    click_on 'Login'

    expect(current_path).to eq('/login')

    fill_in 'username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Submit'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome #{user.username}")
    expect(page).to have_link('Logout')
    expect(page).to_not have_link('Login')
  end

  scenario 'is not allowed on dashboard if not logged in' do
    visit dashboard_path
    expect(current_path).to eq(login_path)
  end
end
