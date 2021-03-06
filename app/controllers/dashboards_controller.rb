class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def dashboard
    @category   = Category.order("discipline")
    @comments   = Comment.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    @industries = Industry.order("industry ASC")
    #@categories = Category.where("category = ?", " ")
    
    
  end
  
  def onboarding
    @comments   = Comment.order("created_at DESC")
    @last_comment = @comments.last
    @last_comment_company = @last_comment.get_company_for_comment
  end
  
  def end_onboarding
    #5 to signify end of onboarding atm - will change
    current_user.update_attributes(:onboarding_stage => "5")
    redirect_to root_path
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
  
  def users
    @users = User.find(params[:id])
  end

end
