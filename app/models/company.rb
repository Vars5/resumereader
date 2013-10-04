class Company < ActiveRecord::Base
  
  attr_accessible :name, :industry, :website , :hr_email, :info, :logo, :industry_id, :company_id,  :comments
  
  has_many :jobs
  has_many :boards
  
  has_many :follows
  has_many :users, through: :follows
  
  validates :name,     presence: :true, :uniqueness => true
#  validates :industry, presence: :true
#  validates :website,  presence: :true
#  validates :info,     presence: :true

  has_attached_file :logo
=begin
:styles => {  
    :thumb => [">75x"],
    :medium => [">600x"]
    }
=end  

  #Comments
  acts_as_commentable
   
  def has_image?
    self.logo_file_name != nil
  end
  
  def has_jobs
    self.jobs(true)
  end
  
  def has_number_of_jobs
    self.has_jobs.count
  end
      
  #search
  def self.search(search)
    if search
      where('industry LIKE ?', "%#{search}%")
    else
      scoped
    end
  end    

=begin      
  def self.companies_followed_by(user)
    followed_company_ids = "SELECT company_id FROM follows 
                            WHERE user_id = :user.id",
        where("user_id IN (#{followed_company_ids}) OR user_id = :user_id", user_id: user.id)
  end
=end

  
end
