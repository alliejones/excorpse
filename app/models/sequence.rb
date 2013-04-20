class Sequence < ActiveRecord::Base
  attr_accessible :complete

  has_many :steps
  has_many :sequences, :through => :steps
end
