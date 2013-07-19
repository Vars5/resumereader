class GroupmembersController < ApplicationController

  def create
    @invite_hash = params[:invite]
    @user = User.find_by_email(@invite_hash[:email])
    
    if @user.blank?
      User.invite!(:email => @invite_hash[:email], :invited_by_id => current_user)
      
      @new_user = User.last #this is not good logic
      @invite = @new_user.groupmembers.build(params[:groupmember])
      if @invite.save
        # redirect and respond_to block            
      end
      
    else
      @invite = params[:id]
      @invite = @user.groupmembers.build(params[:groupmember])
      if @invite.save
        UserMailer.new_group(@user).deliver
        # Alert 
        # 
    end 
  end
    
    
   
  end
=begin
  def destroy
     @invite_hash = params[:invite]
      :email = User.find(@invite_hash[:email].constantize)
      #email = User.find_by_email(@email)
      if :email.blank?
        link_to new_invitation_path(:email)
      else
        redirect_to root_path
      end
  end
=end









end
