class DiscussionsController < ApplicationController
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = Discussion.new(params[:discussion])
    @discussion.user_id = current_user.id
    if @discussion.save
      redirect_to comment_path(@discussion.comment_id)
    else
      #error
    end
  end



end
