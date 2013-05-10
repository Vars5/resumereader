class School < ActiveRecord::Base
  attr_accessible :degree, :majors, :marks, :name, :user_id
  belongs_to :user
  
  validates :user_id, presence: :true
  validates :name, presence: :true
  validates :degree, presence: :true
  
end
