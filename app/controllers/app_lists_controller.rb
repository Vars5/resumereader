class AppListsController < ApplicationController

  def create
    @appList = current_user.app_lists.build(params[:applist])
    @job = Job.find_by_id(params[:applist][:job_id])
    if @appList.save
      redirect_to @job
    end
  end

end
