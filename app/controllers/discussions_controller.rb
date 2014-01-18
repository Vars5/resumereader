class DiscussionsController < ApplicationController
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = Discussion.new(params[:discussion])
    @discussion.user_id = current_user.id
    if @discussion.save
      @comment = Comment.where("id = ?", @discussion.comment_id)
      redirect_to root_path #change to @comment Fix
    else
      #error
    end
  end



end
