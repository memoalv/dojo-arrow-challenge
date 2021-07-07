require 'system_helper'

RSpec.describe "New user session", type: :system do
  let(:user) { create(:user) }

  context "with correct credentials" do
    scenario "should be successful" do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in 'Password', with: 'crazy_pwd'
      click_on "Log in"

      expect(page).to have_content('Sign out')
    end
  end

  context "with incorrect credentials" do
    scenario "should be unsuccessful" do
      visit new_user_session_path
      fill_in "user_email", with: user.email
      fill_in 'user_password', with: 'wrong_password'
      click_on "Log in"

      expect(page).to have_content('Log in')
    end
  end
end
