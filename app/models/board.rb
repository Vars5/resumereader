class Board < ActiveRecord::Base
  
  attr_accessible :name, :company_id

  has_many :posts

end
