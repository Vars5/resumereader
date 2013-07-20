class GroupmembersController < ApplicationController

  # send the group_id into the Groupmember model
  #redirection
  # ajax queries
  
  
   
  
  def create
    @invite_hash = params[:invite]
    @user = User.find_by_email(@invite_hash[:email])
    
    @group = Group.find(@invite_hash[:group_id])
    
    if @user.blank?
      User.invite!(:email => @invite_hash[:email], :invited_by_id => current_user.id)
      
      @new_user = User.last #this is not good logic
      @invite = @new_user.groupmembers.build(:group_id => @invite_hash[:group_id])
      
      if @invite.save
        redirect_to @group          
      end
      
    else
      @invite = @user.groupmembers.build(params[:groupmember])
      if @invite.save
        UserMailer.new_group(@user).deliver
        # Alert 
        # redirect_to 
        # respond_to do |format|
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
