class Company < ActiveRecord::Base
  
  attr_accessible :name, :industry, :website , :hr_email, :info
  
  has_many :jobs
  
  validates :name,     presence: :true, :uniqueness => true
  validates :industry, presence: :true
  validates :website,  presence: :true
  validates :info,     presence: :true

      
end
