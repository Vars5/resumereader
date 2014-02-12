class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :new_question
  before_filter :configure_permitted_parameters, if: :devise_controller?


  if Rails.env.production?
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end
  end 





  #after_filter response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
  #after_filter response.headers["Pragma"] = "no-cache"
  #after_filter response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"


  def new_question
      @ask_question = Question.new
  end
    
end
