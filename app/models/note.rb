class Note < ActiveRecord::Base
  attr_accessible :app_list_id, :info, :title, :type, :user_id
  
  belongs_to :app_list
  
  validates :info, presence: :true
end
