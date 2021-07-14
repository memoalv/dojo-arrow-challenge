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
end
