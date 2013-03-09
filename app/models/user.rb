class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :articles

  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :paswword, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_secure_password
end
