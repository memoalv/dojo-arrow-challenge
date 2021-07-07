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
end
