class AppListsController < ApplicationController

  before_filter :authenticate_user!
  authorize_resource :except => [:create]

  def create
    @appList = current_user.app_lists.build(params[:applist])
    @appList.status = "Research"
    @job = Job.find_by_id(params[:applist][:job_id])
    if @appList.save
      redirect_to @appList
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
    @comments = @appList.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@appList, current_user, "")
  end

  def update
    @appList = current_user.app_lists.find_by_id(params[:applist][:id])
    if @appList.update_attributes(params[:applist])
      if @appList.status == "unfollow"
        @appList.check_destroy_status        
        redirect_to root_path
      else
        respond_to do |format|
          format.html{redirect_to :back}
          #format.js
        end
      end
    end    
  end
  
  def destroy
    @appList = current_user.app_lists.find_by_id(params[:id]).destroy
    respond_to do |format|
      #format.html { redirect_to root_path }
      format.js
    end
  end

end
