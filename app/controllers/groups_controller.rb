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
    if @group.save 
      redirect_to @group
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.update_attributes(params[:id])
  end
  
  def show
    @group = Group.find(params[:id])
    @groupmembers = Groupmember.where("group_id = ?",params[:id])    
    @comments = @group.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@group, current_user, "")

  end

  def index
    @groups = current_user.groups.all
  end


  def invite
      
  end

    
end
