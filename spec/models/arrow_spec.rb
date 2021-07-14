require 'rails_helper'

RSpec.describe Arrow, type: :model do
  let(:sent_by) { create(:user, name: 'user_1') }
  let(:received_by) { create(:user, name: 'user_2') }

  subject { build(:arrow, from_user_id: sent_by.id, to_user_id: received_by.id) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end

  describe 'associations' do
    it { should belong_to(:to_user) }
    it { should belong_to(:from_user) }
  end

  describe 'scopes' do
    it 'Orders arrows in descending order by created_at date' do
      create(:arrow, from_user_id: sent_by.id, to_user_id: received_by.id, content: 'past_arrow',
                     created_at: '2021-05-09 22:06:16.109513000 +0000')
      create(:arrow, from_user_id: sent_by.id, to_user_id: received_by.id, content: 'recent_arrow',
                     created_at: '2021-06-09 22:06:16.109513000 +0000')

      expect(Arrow.descending[0].content).to eq 'recent_arrow'
    end
  end
end
