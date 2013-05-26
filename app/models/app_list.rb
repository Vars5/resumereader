class AppList < ActiveRecord::Base

  attr_accessible :job_id, :status, :comments

  belongs_to :user
  belongs_to :job
  
  validates :job_id, presence: :true
  validates :user_id, presence: :true
  
  def find_job
    Job.find(self.job_id)
  end
  
  def check_destroy_status
    if self.status == "unfollow"
      self.destroy
    end
  end
  

end
