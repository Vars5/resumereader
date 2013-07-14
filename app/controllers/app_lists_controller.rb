class AppListsController < ApplicationController

  before_filter :authenticate_user!
  authorize_resource :except => [:create]

  def create
    @appList = current_user.app_lists.build(params[:applist])
    @job = Job.find_by_id(params[:applist][:job_id])
    if @appList.save
      redirect_to @job
      flash[:success] = "You're now following the #{@job.find_company.name} #{@job.name}"
    else
      flash[:alert] = "You're already following this job!"
      redirect_to @job
    end
  end


  def show
    @appList = AppList.accessible_by(current_ability).find_by_id(params[:id])
    @job = @appList.find_job
    @company = @job.find_company
  end

  def update
    @appList = current_user.app_lists.find_by_id(params[:applist][:id])
    if @appList.update_attributes(params[:applist])
      respond_to do |format|
        format.html{redirect_to :back}
        #format.js
      end
    end
    @appList.check_destroy_status
  end
  
  def destroy
    @appList = current_user.app_lists.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end
