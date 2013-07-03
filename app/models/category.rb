class Category < ActiveRecord::Base
  attr_accessible :discipline
  
  belongs_to :jobs
  belongs_to :company
end
