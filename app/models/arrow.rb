class Arrow < ApplicationRecord
  belongs_to :received_by_user, class_name: 'User', foreign_key: 'received_by_user_id'
  belongs_to :sent_by_user, class_name: 'User', foreign_key: 'sent_by_user_id'

  validates :received_by_user_id, presence: true
  validates :content, presence: true
  validates :sent_by_user_id, presence: true
end
