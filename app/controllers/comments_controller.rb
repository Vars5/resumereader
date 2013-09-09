class CommentsController < ApplicationController

  before_filter :authenticate_user!
  

  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
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
  
end