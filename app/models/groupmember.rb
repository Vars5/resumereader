class Groupmember < ActiveRecord::Base
  attr_accessible :admin, :group_id, :user_id

  #social _feature_
  belongs_to :user
  belongs_to :group
  

end
