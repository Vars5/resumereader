class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_commentable, :only => [:upvote, :downvote]
  before_filter :find_comment, :only => [:upvote, :downvote]
  

  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body], @comment_hash[:title], @comment_hash[:subject])
    if @comment.save
      render partial: 'comments/comment', locals: {comment: @comment}, layout: false, status: :created
      
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
    @comment.liked_by current_user
    redirect_to(@comment.commentable)
#    @comment = Comment.find(params[:id])
#    @comment.liked_by current_user
  end
  
  def downvote
    @comment.downvote_from current_user
    redirect_to(@comment.commentable)
#    @comment = Comment.find(params[:id])
#    @comment.downvote_from current_user
    
  end
  
  def index
      authorize! :manage, :all
      @comment = Comment.all
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
