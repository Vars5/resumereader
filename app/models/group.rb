class Group < ActiveRecord::Base
  attr_accessible :name, :private, :groupmembers_attributes

  #social _feature_
  has_many :groupmembers
  has_many :users, through: :groupmembers
  accepts_nested_attributes_for :groupmembers


end
