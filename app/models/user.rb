class User < ActiveRecord::Base

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :mobile_number, :role, :access, :username, :onboarding_stage

  VALID_ALUMNI_REGEX = /^([\w\.%\+\-]+)@unswalumni.com$/i
  VALID_STUDENT_REGEX = /^([\w\.%\+\-]+)@student.unsw.edu.au$/i
  VALID_UNSW_REGEX = /^([\w\.%\+\-]+)@unsw.edu.au$/i
  VALID_ZMAIL_REGEX = /^([\w\.%\+\-]+)@zmail.unsw.edu.au$/i

  
  #has_many :reviews, dependent: :destroy
  #user follows company
  has_many :follows
  has_many :companies, through: :follows
  
  
  #validations
  #VALID_USERNAME_REGEX = /^[\w-]+$/
  validates :username, :presence => true, length: { maximum: 30 }, :uniqueness => true
  validate :email_is_valid_email_at_unsw

  acts_as_voter
  
  
  def email_is_valid_email_at_unsw
     unless(((self.email =~ VALID_ALUMNI_REGEX ) or (self.email =~ VALID_STUDENT_REGEX)) or ((self.email =~ VALID_UNSW_REGEX ) or (self.email =~ VALID_ZMAIL_REGEX )))
       errors.add(:email, "is not a valid UNSW student email")
     end
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

  def displayname
    if self.username == nil
      "Me"
    else
      self.username
    end
  end
  
end
