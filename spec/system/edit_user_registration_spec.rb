require 'system_helper'

RSpec.describe 'Edit user registration info', type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'The user should be able to edit his name and email correctly' do
    visit edit_user_registration_path

    fill_in 'Name', with: 'different name'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Current password', with: 'crazy_pwd'
    click_on 'Update'

    expect(page).to have_content('Sign out')
  end

  scenario 'The user should be able to edit only his name correctly' do
    visit edit_user_registration_path

    fill_in 'Name', with: 'different name'
    fill_in 'Current password', with: 'crazy_pwd'
    click_on 'Update'

    expect(page).to have_content('Sign out')
  end

  scenario 'The user should be able to edit only his email correctly' do
    visit edit_user_registration_path

    fill_in 'Email', with: 'email@email.com'
    fill_in 'Current password', with: 'crazy_pwd'
    click_on 'Update'

    expect(page).to have_content('Sign out')
  end

  scenario 'The user should not be able to edit his info by leaving the current password field blank' do
    visit edit_user_registration_path

    fill_in 'Name', with: 'different name'
    fill_in 'Email', with: 'email@email.com'
    click_on 'Update'

    expect(page).to have_content("Current password can't be blank")
  end

  scenario 'The user should not be able to edit his info without his correct password' do
    visit edit_user_registration_path

    fill_in 'Name', with: 'different name'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Current password', with: 'wrong password'
    click_on 'Update'

    expect(page).to have_content('Current password is invalid')
  end
end
