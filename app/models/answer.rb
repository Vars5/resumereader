class Answer < ActiveRecord::Base
  attr_accessible :comment_id, :question_id, :user_id
  
  belongs_to :question
end
