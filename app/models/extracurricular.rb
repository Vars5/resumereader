class Extracurricular < ActiveRecord::Base
  attr_accessible :name, :role, :bullets_attributes
  
  #associations
  belongs_to :user
  has_many :bullets, as: :bulletable  #polymorphic association with Bullets
  has_many :responses, as: :responseable #polymorphic association with respones
  
  accepts_nested_attributes_for :bullets 
end
