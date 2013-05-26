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
  
  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 30 }

  
  def app_list_feed
    AppList.where("user_id = ?", self.id)
  end

  def app_list_count
    AppList.where("user_id = ?", self.id).count
  end

  

  
end
