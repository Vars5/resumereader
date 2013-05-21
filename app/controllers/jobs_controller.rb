class JobsController < ApplicationController

  
  def create
    @company = Company.find_by_id(params[:jobs][:id])
    @job = @company.jobs.build(params[:jobs])
    if @job.save
      redirect_to @company
    end
  
  end
  
  def index
  end
  
  def show
    @job = Job.find_by_id(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  


end
