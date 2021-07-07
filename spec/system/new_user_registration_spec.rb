require 'system_helper'

RSpec.describe "New user registration", type: :system do

  scenario "The user should be able to register correctly" do
    visit new_user_registration_path
    fill_in "Name", with: "UsersName"
    fill_in "Email", with: "email@email.com"
    fill_in 'Password', with: 'crazy_pwd'
    fill_in 'Password confirmation', with: 'crazy_pwd'
    click_on "Sign up"

    expect(page).to have_content('Sign out')
  end

  scenario "The user's name is required" do
    visit new_user_registration_path

    fill_in "Email", with: "email@email.com"
    fill_in 'Password', with: 'crazy_pwd'
    fill_in 'Password confirmation', with: 'crazy_pwd'
    click_on "Sign up"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "The user's email is required" do
    visit new_user_registration_path

    fill_in "Name", with: "UsersName"
    fill_in 'Password', with: 'crazy_pwd'
    fill_in 'Password confirmation', with: 'crazy_pwd'
    click_on "Sign up"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "Passwords must match" do
    visit new_user_registration_path

    fill_in "Name", with: "UsersName"
    fill_in "Email", with: "email@email.com"
    fill_in 'Password', with: 'crazy_pwd'
    fill_in 'Password confirmation', with: 'crazy_pwd1'
    click_on "Sign up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "Shows multiple validation errors simultaniously" do
    visit new_user_registration_path

    fill_in 'Password', with: 'crazy_pwd'
    fill_in 'Password confirmation', with: 'crazy_pwd1'
    click_on "Sign up"

    expect(page).to have_content("3 errors prohibited this user from being saved")
  end
end
