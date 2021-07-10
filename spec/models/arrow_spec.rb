require 'rails_helper'

RSpec.describe Arrow, type: :model do
  let(:sent_by) { create(:user, name: 'user_1') }
  let(:received_by) { create(:user, name: 'user_2') }

  subject { build(:arrow, from_user_id: sent_by.id, to_user_id: received_by.id) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { should validate_presence_of(:from_user_id) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:to_user_id) }
  end

  describe 'associations' do
    it { should belong_to(:to_user).with_foreign_key('to_user_id') }
    it { should belong_to(:from_user).with_foreign_key('from_user_id') }
  end
end
