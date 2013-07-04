class Role < ActiveRecord::Base
  attr_accessible :role
  
  belongs_to :job
end
