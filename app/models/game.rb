class Game < ActiveRecord::Base
  attr_accessible :complete

  has_many :steps
  has_many :users, :through => :steps
end
