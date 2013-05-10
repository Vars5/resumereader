class Extracurricular < ActiveRecord::Base
  attr_accessible :name, :role
  
  belongs_to :user
end
