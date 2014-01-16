class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def dashboard
    @category   = Category.order("discipline")
    @comments   = Comment.order("created_at DESC").paginate(:page => params[:page])
    @question   = Question.new
  end
  
  def add_quick_follow_list
    current_user.quick_follow_list(params[:quicklist][:follow_number])
    redirect_to root_path
  end
  
  def follow
    @feed = current_user.companies.all
  end
  
  def admin
    @list = User.order('created_at')
    @comment = Comment.order('created_at')
    @company = Company.all
    authorize! :create, @job      
  end

  def upvoted_comments    
  end

end
