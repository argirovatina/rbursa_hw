class User < ActiveRecord::Base

  has_secure_password
  has_many :petitions
  has_many :votes

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 256 }
  validates :last_name, presence: true, length: { maximum: 256 }
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, on: :create

  def petition_author
    User.find(id = @petition.user_id)
  end

end
