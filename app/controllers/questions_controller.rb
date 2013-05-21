class QuestionsController < ApplicationController
  
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
  end
  
  def edit
  end
  
end
