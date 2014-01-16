class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :new_question
  
  if Rails.env.production?
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end
  end 


  def new_question
      @ask_question = Question.new
  end
    
end
