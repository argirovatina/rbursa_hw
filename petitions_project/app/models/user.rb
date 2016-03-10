class User < ActiveRecord::Base

  has_secure_password
  has_many :petitions

  #attr_accessor :name, :last_name, :password, :confirm_password, :email

  validates :first_name, presence: true, length: { maximum: 256 }
  validates :last_name, presence: true, length: { maximum: 256 }
  validates :password, presence: true, length: { minimum: 4 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }


end
