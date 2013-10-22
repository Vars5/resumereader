class Questioncomment < ActiveRecord::Base
  attr_accessible :comment_id, :question_id, :user_id, :questioncomment_attributes
  
  belongs_to :question
  belongs_to :comment

end
