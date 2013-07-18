class GroupsController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource :only => :new
  
  def new
    @group = Group.new
    @group.groupmembers.build
  end

  def create
    @group = Group.new(params[:group])
    @group.save
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.update_attributes(params[:id])
  end
  
  def show
    @group = Group.find(params[:id])
    #@groupmembers = Groupmember.where("group_id = ?",params[:id])    
    @comments = @group.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@group, current_user, "")
  end

  def index
    @groups = current_user.groups.all
  end


  def invite
=begin  
    #Needs to be fixed
    
    email = User.find_by_email(@invite)
    if email.blank?
      link_to new_invitation_path(email)
    else
      redirect_to root_path
    end
=end
  end

    
end
