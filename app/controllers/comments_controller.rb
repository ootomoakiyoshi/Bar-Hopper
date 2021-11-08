class CommentsController < ApplicationController

  def create
   bar = Bar.find(params[:bar_id])
   comment = current_user.comments.new(comment_params)
   comment.bar_id = bar.id
   comment.save
   redirect_to bar_path(bar)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to bar_path(params[:bar_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
