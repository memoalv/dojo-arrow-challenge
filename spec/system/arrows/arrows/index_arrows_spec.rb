require 'system_helper'

RSpec.describe 'Arrows list', type: :system do
  let(:user) { create(:user) }
  let(:user_2) { create(:user, name: 'Test user 2', email: 'user_2@test.com') }

  before do
    sign_in user
  end

  scenario 'displays user info' do
    expect(page).to have_content(user.name)
    expect(page).to have_content('0 points')
  end

  scenario 'displays a received arrow correctly' do
    user_2.sent_arrows.create(to_user_id: user.id, content: 'test_arrow',
                              created_at: '2021-06-09 22:06:16.109513000 +0000')

    visit arrows_root_path

    expect(page).to have_content('DATE: 09 Jun 22:06')
  end

  scenario "displays an arrow's details correctly" do
    user_2.sent_arrows.create(to_user_id: user.id, content: 'test_arrow',
                              created_at: '2021-06-09 22:06:16.109513000 +0000')

    visit arrows_root_path
    click_on 'More details'

    expect(page).to have_content('Test user 2')
    expect(page).to have_content('test_arrow')
  end
end
