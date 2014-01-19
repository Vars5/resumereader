class Discussion < ActiveRecord::Base
  attr_accessible :comment_id, :content, :user_id
end
