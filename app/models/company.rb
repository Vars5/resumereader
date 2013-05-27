class Company < ActiveRecord::Base
  
  attr_accessible :name, :industry, :website , :hr_email, :info, :logo
  
  has_many :jobs
  has_many :boards
  
  validates :name,     presence: :true, :uniqueness => true
  validates :industry, presence: :true
  validates :website,  presence: :true
  validates :info,     presence: :true

  has_attached_file :logo
   
   
  def has_image?
    self.logo_file_name != nil
  end
  
  def has_jobs
    self.jobs(true)
  end
  
  def has_number_of_jobs
    self.has_jobs.count
  end
      
end
