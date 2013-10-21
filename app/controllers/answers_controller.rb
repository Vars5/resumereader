class AnswersController < ApplicationController
  
  def create
    @answer = Answer.create(params[:answer])
  end

end
