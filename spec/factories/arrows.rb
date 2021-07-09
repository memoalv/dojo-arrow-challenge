FactoryBot.define do
  factory :arrow do
    received_by_user_id factory: :user
    content { 'MyText' }
    sent_by_user_id factory: :user
  end
end
