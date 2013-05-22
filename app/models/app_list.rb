class AppList < ActiveRecord::Base

  attr_accessible :job_id, :status, :comments

  belongs_to :user
  
  validates :job_id, presence: :true
  validates :user_id, presence: :true
  
end
