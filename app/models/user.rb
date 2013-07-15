class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :mobile_number, :role,
                  :schools_attributes, :employments_attributes, :extracurriculars_attributes
  # attr_accessible :title, :body
  
  has_one  :setting, dependent: :destroy
  
  has_many :schools, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :extracurriculars, dependent: :destroy
  has_many :app_lists, dependent: :destroy 

  
  has_many :reviews, dependent: :destroy
  
  #user follows company
  has_many :follows
  has_many :companies, through: :follows
  
  #validations
  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 30 }

  
  def app_list_feed
    AppList.where("user_id = ?", self.id)
  end

  def app_list_count
    AppList.where("user_id = ?", self.id)
  end

  def is_following_applist?(job)
    self.app_lists.find_by_job_id(job.id) != nil
  end

  def has_no_applists?
    self.app_lists.count == 0
  end
  
  #User Follows a company
  def follow!(company)
    self.follows.create!(company_id: company.id)
  end
  
  def following?(company)
    self.follows.find_by_company_id(company.id)
  end
  
#  def unfollow!(company)
#    self.follows.find_by_company_id(company.id).destroy
#  end
  

end
