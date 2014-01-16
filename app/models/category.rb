class Category < ActiveRecord::Base

  attr_accessible :discipline, :name, :category
  
  has_many :comments

  validates :name, :uniqueness => true

end
