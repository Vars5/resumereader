class AppList < ActiveRecord::Base

  attr_accessible :job_id, :status, :comments

  has_many :notes

  belongs_to :user  
  belongs_to :job, touch: true
  
  validates :job_id, presence: :true
  validates :user_id, presence: :true
  
  def find_job
#    Job.order("date(due_date) DESC").find(self.job_id)
    Job.find(self.job_id) #, order: "date(due_date) DESC")
  end
  
  def check_destroy_status
    if self.status == "unfollow" 
      self.destroy
    end
  end

  def create_new_note
    self.notes.build
  end

end
