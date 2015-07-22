class QuestionsController < ApplicationController

  def index
    @questions = Question.all.sort_by{ |object| [object.created_at]}.reverse
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    current_user.questions.push(@question)
    if @question.save
      flash[:notice] = "Your question has been added!"
      @question.user = current_user
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
    @total = @question.votes_a + @question.votes_b
    @percent_votes_a = (((@question.votes_a.to_f)/@total.to_f)*100).round(2)
    @percent_votes_b = (((@question.votes_b.to_f)/@total.to_f)*100).round(2)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @question = Question.destroy(params[:id])
    @question.destroy
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
