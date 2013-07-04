class RolesController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource 
  
  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
        redirect_to roles_index_path
    end
  end
  
  def edit
    @role = Role.find(params[:id])
  end
  
  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      redirect_to roles_index_path
    end
  end
    
  def index
    @roles = Role.all
  end
  
end
