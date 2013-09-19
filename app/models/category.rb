class Category < ActiveRecord::Base

  attr_accessible :discipline
  
  belongs_to :jobs
  
  validates :discipline, :presence => true
  validates :discipline, :uniqueness => true

end
