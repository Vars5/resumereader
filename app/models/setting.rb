class Setting < ActiveRecord::Base
  attr_accessible :goal, :forum_name
  
  validates :forum_name, :uniqueness => true
  validates :goal, length: { maximum: 180 }
  
end
