class User < ActiveRecord::Base

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :mobile_number, :role,
                  :schools_attributes, :employments_attributes, :extracurriculars_attributes,:avatar, :access

  
  has_one  :setting, dependent: :destroy
  
  has_many :schools, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :extracurriculars, dependent: :destroy
  has_many :app_lists, dependent: :destroy 

  
  has_many :reviews, dependent: :destroy
  
  #user follows company
  has_many :follows
  has_many :companies, through: :follows
  
  #social _feature_
  has_many :groupmembers
  has_many :groups, through: :groupmembers
  
  
  #validations
  validates :first_name, :presence => true
  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 30 }

  acts_as_voter

  def is_following_applist?(job)
    self.app_lists.find_by_job_id(job.id) != nil
  end

  def quick_follow_list(category_id)
    
    discipline_jobs = Job.where("category_id = ?", category_id)
    discipline_jobs.each do |job|
      if self.is_following_applist?(job)
        #do nothing
      else  
        self.app_lists.create( :job_id => job.id )        
      end
    end
  end
  
  def app_list_feed
    AppList.where("user_id = ?", self.id)
  end

  def app_list_count
    AppList.where("user_id = ?", self.id).count
  end

  def has_no_applists?
    self.app_lists.count == 0
  end
  
  def follow!(company)
    self.follows.create!(company_id: company.id)
  end
  
  def following?(company)
    self.follows.find_by_company_id(company.id)
  end

  has_attached_file :avatar,
      :styles => {
        :list => "40x40>",
        :comment =>"50x50",
        :large =>"80x80x"
      },
      :storage => :s3,
      :bucket => 'resquery-avatars',
      :url => ":s3_domain_url",
      :path => "/:class/avatars/:id_:basename.:style.:extension",
      :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }

  def groups_list
    Groupmember.where("user_id = ?", self.id)
  end
  
  
  def has_no_groups?
    self.groups_list.count == 0
  end
  
  
  
end
