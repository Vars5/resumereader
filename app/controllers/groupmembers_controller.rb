class GroupmembersController < ApplicationController

  # send the group_id into the Groupmember model
  #redirection
  # ajax queries
  
  
   
  
  def create
    @invite_hash = params[:invite]
    @user = User.find_by_email(@invite_hash[:email])
    
    @group = Group.find(@invite_hash[:group_id])
    
    if @user.blank?
      User.invite!({:email => @invite_hash[:email]}, current_user )
      
      @new_user = User.last #this is not good logic
      @invite = @new_user.groupmembers.build(:group_id => @invite_hash[:group_id])
      
      if @invite.save
        redirect_to @group          
      end
      
    else
      @invite = @user.groupmembers.build(params[:groupmember])
      if @invite.save
        UserMailer.new_group(@user, current_user,@group).deliver
        redirect_to @group
        flash[:success] = "TEST" ##{@user.first_name} has been added #{@group.name}!"
    end 
  end
    
    
   
  end

  def destroy
    
    @invite = Groupmember.find_by_id(params[:id]).destroy
    if @invite.destroy
      render 'new'
    end
    
  end










end
