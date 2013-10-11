class Category < ActiveRecord::Base

  attr_accessible :discipline, :name, :category
  
  belongs_to :jobs
  has_many :comments

  validates :name, :uniqueness => true

end
