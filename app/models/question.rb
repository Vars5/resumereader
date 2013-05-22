class Question < ActiveRecord::Base
  attr_accessible :question_content
  
  has_many :responses, dependent: :destroy
end
