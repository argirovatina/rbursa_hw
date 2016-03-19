class Petition < ActiveRecord::Base

  EXPIRATION_PERIOD = 30

  belongs_to :user
  has_many :votes

  validates :user_id, presence: true

  validates :title,  presence: true, length: { maximum: 256 }
  validates :text,  presence: true, length: { maximum: 2000 }
  validate :expired?, on: :create

  scope :created_before, ->(time) { where("created_at < #{Time.now - EXPIRATION_PERIOD}", time) }

  def voted_by?(current_user)
    votes.where(user_id: current_user.id).any?
  end

  def expired?
    @petition = Petition.find(params[:petition_id])
    Petition.created_before(@petition.created_at)
  end

end
