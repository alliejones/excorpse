class Step < ActiveRecord::Base
  attr_accessible :contents, :sequence_id, :type, :user_id

  belongs_to :sequence
  belongs_to :user
end
