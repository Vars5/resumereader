class Category < ActiveRecord::Base

  attr_accessible :discipline
  
  belongs_to :jobs
  
  validates :first_name, :presence => true

end
