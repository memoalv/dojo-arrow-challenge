class Arrow < ApplicationRecord
  belongs_to :to_user, class_name: 'User', foreign_key: 'to_user_id'
  belongs_to :from_user, class_name: 'User', foreign_key: 'from_user_id'

  validates :to_user_id, presence: true
  validates :content, presence: true
  validates :from_user_id, presence: true
end