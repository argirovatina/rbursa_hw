class Petition < ActiveRecord::Base

  attr_accessor :petition

  belongs_to :user


end
