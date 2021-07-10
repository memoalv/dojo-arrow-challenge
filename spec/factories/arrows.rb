FactoryBot.define do
  factory :arrow do
    to_user_id factory: :user
    content { 'MyText' }
    from_user_id factory: :user
  end
end
