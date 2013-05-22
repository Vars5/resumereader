class Job < ActiveRecord::Base
  
  attr_accessible :name, :link, :discipline, :info, :due_date
  
  belongs_to :company
  
  validates :name, presence: :true
  validates :discipline, presence: :true
  validates :info, presence: :true 
  
end
