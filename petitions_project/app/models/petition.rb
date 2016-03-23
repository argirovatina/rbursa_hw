require 'Date'
class Petition < ActiveRecord::Base

  EXPIRATION_PERIOD = 30

  belongs_to :user
  has_many :votes

  validates :user_id, presence: true

  validates :title,  presence: true, length: { maximum: 256 }
  validates :text,  presence: true, length: { maximum: 2000 }
  validate :expired?

  scope :created_before, -> { where("created_at < ?", "#{Date.today - EXPIRATION_PERIOD}") }

  def voted_by?(current_user)
    votes.where(user_id: current_user.id).any?
  end

  def expired?
    Petition.created_before.include? self
  end

end
