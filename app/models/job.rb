class Job < ActiveRecord::Base
  
  attr_accessible :name, :link, :discipline, :info, :due_date, :role, :category_id, :role_id, :location, :open, :job_type
  
  belongs_to :company
  
  has_many :app_lists, dependent: :destroy
  has_many :categories
  has_many :roles
  
  validates :name, presence: :true
  validates :job_type, presence: :true
  validates :category_id, presence: :true
  validates :role_id, presence: :true
  validates :info, presence: :true 
  validates :link, presence: true
  validates :due_date, presence: true
  
  #swiftype information 
  after_save :enqueue_create_or_update_document_job
  after_destroy :enqueue_delete_document_job
  
#  before_save :set_job_title
  
  def set_job_title
    
  end
  
  def find_company
    Company.find_by_id(self.company_id)
  end
  
  def show_company_name
    self.find_company.name
  end
  
  def relevant_hr_email
    self.find_company.hr_email
  end
  
  def show_due_date
    if self.due_date != nil 
      if self.due_date < DateTime.now
        "Closed"
      else
        self.due_date.strftime("%b %e") 
      end
    end
  end
  
  def has_website?
    self.link != nil
  end
  
  def self.search(search)
    if search
      where('discipline LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  
  private

    def enqueue_create_or_update_document_job
      Delayed::Job.enqueue CreateOrUpdateSwiftypeDocumentJob.new(self.id)
    end

    def enqueue_delete_document_job
      Delayed::Job.enqueue DeleteSwiftypeDocumentJob.new(self.id)
    end


  
end
