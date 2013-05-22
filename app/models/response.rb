class Response < ActiveRecord::Base
  attr_accessible :answer, :question_id
  
  belongs_to :responseable, polymorphic: true
  belongs_to :question
  
end
