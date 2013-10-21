class Question < ActiveRecord::Base
  attr_accessible :question_content, :user_id, :company_id, :category_id
  
  has_many :answers
end
