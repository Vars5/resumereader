class Employment < ActiveRecord::Base
  attr_accessible :beggining_date, :company, :end_date, :role, :bullets_attributes, :bulletable_attributes
  
  #associations
  belongs_to :user
  has_many :bullets, as: :bulletable  #polymorphic association with Bullets
  has_many :responses, as: :responseable #polymorphic association with respones
  
  #validations
  validates :user_id, presence: :true
  validates :company, presence: :true
  validates :role, presence: :true

  accepts_nested_attributes_for :bullets   
end

