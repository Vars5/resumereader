class Job < ActiveRecord::Base
  
  attr_accessible :name, :link, :discipline, :info, :due_date, :role, :category_id, :role_id
  
  belongs_to :company
  
  has_many :app_lists, dependent: :destroy
  has_many :categories
  has_many :roles
  
  validates :name, presence: :true
  #validates :discipline, presence: :true
  validates :info, presence: :true 
  
  #swiftype information 
  after_save :enqueue_create_or_update_document_job
  after_destroy :enqueue_delete_document_job
  
  def find_company
    Company.find_by_id(self.company_id)
  end
  
  def relevant_hr_email
    self.find_company.hr_email
  end
  
  def show_due_date
    if self.due_date != nil
      self.due_date.strftime("%B %e") 
    end
  end
  
  def has_website?
    self.link != nil
  end
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
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
