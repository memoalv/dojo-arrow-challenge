require 'system_helper'

RSpec.describe 'New user session', type: :system do
  let(:user) { create(:user) }

  context 'with correct credentials' do
    scenario 'should be successful' do
      visit new_user_session_path
      fill_in 'E-MAIL', with: user.email
      fill_in 'PASSWORD', with: 'crazy_pwd'
      click_on 'Log in'

      expect(page).to have_content('Sign out')
    end
  end

  context 'with incorrect credentials' do
    scenario 'should be unsuccessful' do
      visit new_user_session_path
      fill_in 'E-MAIL', with: user.email
      fill_in 'PASSWORD', with: 'wrong_password'
      click_on 'Log in'

      expect(page).to have_content('Invalid Email or password.')
    end
  end

  scenario 'omniauth link for github should be present' do
    visit new_user_session_path

    expect(page).to have_link(nil, href: '/users/auth/github')
  end
end
