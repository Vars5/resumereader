class Article < ActiveRecord::Base
  attr_accessible :author, :content, :published, :title
end