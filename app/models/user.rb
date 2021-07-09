class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :sent_by, class_name: 'Arrow', foreign_key: 'sent_by_user_id'
  has_many :received_by, class_name: 'Arrow', foreign_key: 'received_by_user_id'

  validates :name, presence: true
end
