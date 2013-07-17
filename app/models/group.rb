class Group < ActiveRecord::Base
  attr_accessible :name, :private

  #social _feature_
  has_many :groupmembers
  has_many :users, through: :groupmembers


end
