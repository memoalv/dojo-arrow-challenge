class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, omniauth_providers: %i[github]

  has_many :sent_arrows, class_name: 'Arrow', foreign_key: 'from_user_id'
  has_many :received_arrows, class_name: 'Arrow', foreign_key: 'to_user_id'

  validates :name, presence: true

  scope :exclude_user, ->(user) { where.not(id: user.id) }
  # scope :points, -> { sent_arrows.or(received_arrows).size }

  def points
    # SELECT COUNT(*) FROM "arrows" WHERE ("arrows"."from_user_id" = $1 OR "arrows"."to_user_id" = $2)
    sent_arrows.or(received_arrows).size
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.nickname
    end
  end
end
