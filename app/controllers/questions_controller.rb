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
    @question = Question.find(question_params)

    if params[:value] == @question.description_a
binding.pry
      flash[:alert] = "You voted for choice A!"
      @question.votes_a += 1;
    elsif params[:value] == @question.description_b
      flash[:alert] = "You voted for choice B!"
      @question.votes_b += 1;
    else
      flash[:alert] = "You didn't select a choice. Try again!"
    end
  end

  private
  def question_params
    params.require(:question).permit(:description_a, :image_a, :votes_a, :description_b, :image_b, :votes_b)
  end
end
