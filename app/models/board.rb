class Board < ActiveRecord::Base
  
  attr_accessible :name, :company_id

  has_many :posts

  validates :name, presence: :true
  validates :company_id, presence: :true

end
