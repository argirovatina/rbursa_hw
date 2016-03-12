class Vote < ActiveRecord::Base

  validates uniqueness: {scope: 1}

end
