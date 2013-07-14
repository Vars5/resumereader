class Follow < ActiveRecord::Base
  attr_accessible :user_id, :company_id
  
  # Relationships for user following a company
  belongs_to :user
  belongs_to :company
  
end
