class CommentsController < ApplicationController

  before_filter :authenticate_user!, :except => :show, :except => :new
  before_filter :load_commentable, :only => [:upvote, :downvote]
  before_filter :find_comment, :only => [:upvote, :downvote]
  

  def new
    @comment = Comment.new
    @new_comment = Comment.build_from(@comment, current_user, "", "", "")
  end

=begin
  def create_comment
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_id]
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body], @comment_hash[:title], @comment_hash[:subject])
    if @comment.save
      redirect_to root_path
    end
  end
=end

  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
#    @company = Company.find(@comment_hash[:commentable_id])

    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body], @comment_hash[:title], @comment_hash[:category_id])
    @comment.questioncomment.build(:user_id => current_user.id, :question_id => @obj.id) 
    
    if @comment.save
      redirect_to @obj
      #render partial: 'comments/comment', locals: {comment: @comment}, layout: false, status: :created
      # Send email to all users in Groupmember
    else
      render js: "alert('error saving comment');"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
      if @comment.destroy
        render json: @comment, status: :ok
      else
        render js: "alert('error deleting comment)";
      end
  end 
  
  def upvote
    if((current_user.voted_as_when_voted_for(@comment) == false) || (current_user.voted_as_when_voted_for(@comment) == nil))
      @comment.liked_by current_user
      respond_to do |format|
        format.js
        format.html {redirect_to root_path}
      end
    else
      redirect_to root_path
    end
  end
  
  def downvote
    if((current_user.voted_as_when_voted_for(@comment) == true) || (current_user.voted_as_when_voted_for(@comment) == nil))
      @comment.downvote_from current_user
      respond_to do |format|
        format.js 
        format.html {redirect_to root_path}
      end
    else
      redirect_to root_path        
    end
  end
  
  def edit
    authorize! :manage, :all
    @comment = Comment.find(params[:id])
  end
  
  def update
    authorize! :manage, :all
    @comment = Comment.find(params[:id])
      if @comment.update_attributes(params[:comment])
        redirect_to comments_path
      end
  end
  
  
  def index
      authorize! :manage, :all
      @comment = Comment.all
  end
  
  def show

    @comment = Comment.find(params[:id])
    @company = Company.find(@comment.commentable_id)
    @discussion = Discussion.new
    @discussions = Discussion.where("comment_id = ?", params[:id])
  end
  
  private

    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def find_comment
      @comment = Comment.find(@commentable.id)
    end
  
end
