class Post < ActiveRecord::Base
  
  attr_accessible :text, :board_id, :user_id
  
  belongs_to :user
  belongs_to :board
  
end
