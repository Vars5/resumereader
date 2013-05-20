class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :mobile_number
  # attr_accessible :title, :body
  has_one  :setting, dependent: :destroy
  
  has_many :schools, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :extracurriculars, dependent: :destroy
  

  
end
