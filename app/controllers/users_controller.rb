class UsersController < ApplicationController


=begin
  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to root_path
    else
      render 'new'
    end
  end
=end
  
  
  
end