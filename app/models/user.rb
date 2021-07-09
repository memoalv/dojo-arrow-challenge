class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :sent_arrows, class_name: 'Arrow', foreign_key: 'from_user_id'
  has_many :received_arrows, class_name: 'Arrow', foreign_key: 'to_user_id'

  validates :name, presence: true
end
