require 'system_helper'

RSpec.describe 'Arrows list', type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'Creates an arrow correctly' do
    create(:user, name: 'Test user 2', email: 'user_2@test.com')
    visit arrows_root_path
    click_on 'Create arrow'

    within('form') do
      select 'Test user 2', from: 'For who?'
      fill_in 'Reason', with: 'Awesome arrow'

      click_on 'Create'
    end

    expect(page).to have_content('Arrow sent successfully')
  end

  context 'fails to create arrow' do
    scenario 'when not selecting a user that will recieve it' do
      visit arrows_root_path
      click_on 'Create arrow'

      within('form') do
        fill_in 'Reason', with: 'Awesome arrow'

        click_on 'Create'
      end

      expect(page).to have_content('An error ocurred when creating the arrow')
    end

    scenario 'when not filling the reason why the arrow is being sent' do
      create(:user, name: 'Test user 2', email: 'user_2@test.com')
      visit arrows_root_path
      click_on 'Create arrow'

      within('form') do
        select 'Test user 2', from: 'For who?'

        click_on 'Create'
      end

      expect(page).to have_content('An error ocurred when creating the arrow')
    end

    scenario 'when not filling anything about the arrow' do
      visit arrows_root_path
      click_on 'Create arrow'

      within('form') do
        click_on 'Create'
      end

      expect(page).to have_content('An error ocurred when creating the arrow')
    end
  end
end
