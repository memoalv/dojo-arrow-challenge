require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should allow_value("test@email.com").for(:email) }
  end

  describe 'associations' do
    it { should have_many(:sent_arrows).with_foreign_key('from_user_id') }
    it { should have_many(:received_arrows).with_foreign_key('to_user_id') }
  end
end
