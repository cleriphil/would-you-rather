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

private
  def comment_params
    params.require(:comment).permit(:author, :comment)
  end
end
