class ProblemsController < ApplicationController

  before_filter :authenticate_user!
  
  def create
    @problem = Problem.new(params[:problems])
    if @problem.save
      redirect_to root_path
    end  
  end
  
  def index
    @problem = Problem.all
    authorize! :create, @job
  end

end
