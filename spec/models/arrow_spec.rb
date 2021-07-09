require 'rails_helper'

RSpec.describe Arrow, type: :model do
  let(:sent_by) { create(:user, name: 'user_1') }
  let(:received_by) { create(:user, name: 'user_2') }

  subject { build(:arrow, sent_by_user_id: sent_by.id, received_by_user_id: received_by.id) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { should validate_presence_of(:received_by_user_id) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:sent_by_user_id) }
  end

  describe 'associations' do
    it { should belong_to(:sent_by_user).with_foreign_key('sent_by_user_id') }
    it { should belong_to(:received_by_user).with_foreign_key('received_by_user_id') }
  end
end
