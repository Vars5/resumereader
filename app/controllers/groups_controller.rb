class GroupsController < ApplicationController
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
  end

  def index
    @groups = Groups.all
  end
end
