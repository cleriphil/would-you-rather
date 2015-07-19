class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @user = current_user
    @comment = @question.comments.new(comment_params)
    @user.comments.push(@comment)
    if @comment.save
      flash[:notice] = "Your comment has been added."
    else
      flash[:alert] = "There was a problem adding your comment."
    end
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    redirect_to question_path(@question)

  end

private
  def comment_params
    params.require(:comment).permit(:author, :comment)
  end
end
