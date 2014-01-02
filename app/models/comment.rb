class Comment < ActiveRecord::Base
  
  #note commentable id is the company_id that the comment belongs to
  #also next time, prioritise readabiltiy of code
  attr_accessible :commentable, :body, :user_id, :title, :subject, :category_id, :commentable_id, :commentable_type, :questioncomment_attributes 
  attr_accessor :company_name  
  belongs_to :category

  has_many :questioncomment
  has_many :questions, through: :questioncomment

 accepts_nested_attributes_for :questioncomment
  
  
  #Voteable
  acts_as_votable
  
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates :body, :presence => true
  validates :user, :presence => true
  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, :polymorphic => true

  # NOTE: Comments belong to a user
  belongs_to :user

  #For Infinite Scroll as per http://christianvarga.com/2013/02/simple-infinite-scroll-with-rails-and-jquery/
  self.per_page = 15    

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a user_id, and comment text
  # example in readme
  def self.build_from(obj, user_id, comment, title, category_id)
    new \
      :commentable => obj,
      :body        => comment,
      :user_id     => user_id,
      :title       => title,
      :category_id => category_id
  end

  #helper method to check if a comment has children
  def has_children?
    self.children.any?
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given user.
  scope :find_comments_by_user, lambda { |user|
    where(:user_id => user.id).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end
  
  def get_company_for_comment
    if self.commentable_type == "Company"
      Company.find(self.commentable_id)
    else
      Company.find(Question.find(self.commentable_id).company_id)  
    end   
  end
  
  def set_company_name
    self.company_name = "testing to be asa"
  end
  
end
