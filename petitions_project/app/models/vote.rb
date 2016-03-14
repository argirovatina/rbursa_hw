class Vote < ActiveRecord::Base

  validates_uniqueness_of :vote_id, :scope => [:user_id, :petition_id]

end
