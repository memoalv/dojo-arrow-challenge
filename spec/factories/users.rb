FactoryBot.define do
  factory :user do
    name { 'test_user' }
    sequence(:email) { |n| "test_#{n}@test.com" }
    password { 'crazy_pwd' }
  end
end
