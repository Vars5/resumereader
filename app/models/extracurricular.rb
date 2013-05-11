class Extracurricular < ActiveRecord::Base
  attr_accessible :name, :role
  
  #associations
  belongs_to :user
  has_many :bullets, as: :bulletable  #polymorphic association with Bullets
  has_many :responses, as: :responseable #polymorphic association with respones
  
end
