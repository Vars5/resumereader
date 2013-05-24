class AppListsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @appList = current_user.app_lists.build(params[:applist])
    @job = Job.find_by_id(params[:applist][:job_id])
    if @appList.save
      redirect_to @job
    end
  end

  def update
    @appList = current_user.app_lists.find_by_id(params[:applist][:id])
    if @appList.update_attributes(params[:applist])
      redirect_to root_path
    end
  end

end
