class Note < ActiveRecord::Base
  attr_accessible :app_list_id, :info, :title, :user_id, :kind
  
  belongs_to :app_list
  
  validates :info, presence: :true
  
end
