class Petition < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :user_id, presence: true

  validates :title,  presence: true, length: { maximum: 256 }
  validates :text,  presence: true, length: { maximum: 2000 }

  def voted_by?(user)
    votes.where(user_id: user.id).any?
  end
  
end
