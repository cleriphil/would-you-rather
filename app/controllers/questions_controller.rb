class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Your question has been added!"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "There was a problem adding your question. Please try again."
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    respond_to do |format|
      format.js
    end

  end

  def destroy
    @question = Question.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end

  private
  def question_params
    params.require(:question).permit(:description_a, :image_a, :votes_a, :description_b, :image_b, :votes_b)
  end
end
