class AnswersController < ApplicationController
  
  def create
    @answer = Answer.create(params[:answer])
  end
  
  
  def end
  end

end
