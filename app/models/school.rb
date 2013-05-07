class School < ActiveRecord::Base
  attr_accessible :degree, :majors, :marks, :name, :user_id
  belongs_to :user
end
