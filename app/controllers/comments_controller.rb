class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    current_user.questions.push(@question)
    if @comment.save
      flash[:notice] = "Your question has been added!"
      @comment.user = current_user
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "There was a problem adding your question. Please try again."
      render :new
    end
  end
   def comment_params
    params.require(:comment).permit(:author, :comment, :user_id, :question_id)
  end
end
