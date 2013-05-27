class Job < ActiveRecord::Base
  
  attr_accessible :name, :link, :discipline, :info, :due_date
  
  belongs_to :company
  
  has_many :app_lists, dependent: :destroy
  
  validates :name, presence: :true
  validates :discipline, presence: :true
  validates :info, presence: :true 
  
  
  def find_company
    Company.find_by_id(self.company_id)
  end
  
  def relevant_hr_email
    self.find_company.hr_email
  end
  
  def show_due_date
    if job.due_date != nil
      self.due_date.strftime("%B %e")
    end
  end
  
  
end
