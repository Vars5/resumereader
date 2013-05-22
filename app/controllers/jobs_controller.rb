class JobsController < ApplicationController

  
  def create
    @company = Company.find_by_id(params[:jobs][:id])
    @job = @company.jobs.build(params[:jobs])
    if @job.save
      redirect_to @company
    end
  
  end
  
  def index
    @job = Job.all
  end
  
  def show
    @job = Job.find_by_id(params[:id])
  end
  
  def edit
    @jobs = Job.find_by_id(params[:id])
  end
  
  def update
    @jobs = Job.find_by_id(params[:id])
    if @jobs.update_attributes(params[:jobs])
      redirect_to @jobs
    end
  end
  
  def destroy
    @jobs = Job.find_by_id(params[:id]).destroy
    redirect_to root_path
  end
  


end
