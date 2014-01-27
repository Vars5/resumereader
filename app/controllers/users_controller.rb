class UsersController < ApplicationController

#before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @comments = Comment.where("user_id = ? ", params[:id])
    @discussions = Discussion.where("user_id = ? ", params[:id])
  end
    
end