class QuestionsController < ApplicationController
  
  #authorize_resource :except => [:index, :show]
  #check if this is nested? im not sure how polymorphic works with cancan
  
  before_filter :authenticate_user!
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.build
  end
  
end
