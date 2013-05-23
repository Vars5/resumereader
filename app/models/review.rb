class Review < ActiveRecord::Base
  attr_accessible :user_id, :review_comment
  
  belongs_to :user
end
