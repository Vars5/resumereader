class Employment < ActiveRecord::Base
  attr_accessible :beggining_date, :company, :end_date, :role
  belongs_to :user
  
  validates :user_id, presence: :true
  validates :company, presence: :true
  validates :role, presence: :true
  
end
