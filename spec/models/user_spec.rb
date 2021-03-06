require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  subject { build(:user) }
  let(:user) { create(:user) }
  let(:user_2) { create(:user, name: 'Test user 2', email: 'user_2@test.com') }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should allow_value('test@email.com').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:sent_arrows).with_foreign_key('from_user_id') }
    it { should have_many(:received_arrows).with_foreign_key('to_user_id') }
  end

  describe '.exclude_user' do
    it 'excludes a certain user' do
      expect(User.exclude_user(user)).not_to include(user)
    end
  end

  describe 'A user has no points' do
    it 'when he has not sent or received arrows' do
      expect(user.points).to eql 0
    end
  end

  describe 'A user accumulates points' do
    it 'when sending an arrow' do
      user.sent_arrows.create(to_user_id: user_2.id, content: 'test arrow')

      expect(user.points).to eql 1
    end
    it 'when receiving an arrow' do
      user_2.sent_arrows.create(to_user_id: user.id, content: 'test arrow')

      expect(1).to eql 1
    end
    it 'when sending and receiving arrows' do
      user.sent_arrows.create(to_user_id: user_2.id, content: 'test arrow')
      user_2.sent_arrows.create(to_user_id: user.id, content: 'test arrow')

      expect(user.points).to eql 2
    end
  end

  describe '#from_omniauth' do
    it 'creates a new account for an unregistered user' do
      oauth_user_data = JSON.parse(Faker::Omniauth.github.to_json, object_class: OpenStruct)

      user = User.from_omniauth(oauth_user_data)
      
      expect(user.persisted?).to eql true
      expect(user.provider).to eql oauth_user_data.provider
      expect(user.uid).to eql oauth_user_data.uid
      expect(user.name).to eql oauth_user_data.info.nickname
      expect(user.email).to eql oauth_user_data.info.email
    end
  end
end
