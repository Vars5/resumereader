class Response < ActiveRecord::Base
  attr_accessible :answer
  
  belongs_to :responseable, polymorphic: true
  belongs_to :question
  
end
