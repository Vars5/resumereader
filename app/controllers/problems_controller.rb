class ProblemsController < ApplicationController

  before_filter :authenticate_user!
  
  def create
    @problem = Problem.new(params[:problems])
    if @problem.save
      flash[:success] = "Thanks! We'll try to act on it ASAP!"
      redirect_to :back
    end  
  end
  
  def index
    @problem = Problem.all
    authorize! :create, @job
  end

end
