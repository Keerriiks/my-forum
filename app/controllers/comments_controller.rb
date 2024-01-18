class CommentsController < ApplicationController
  def create
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @comment = current_user.comments.build(comment_params)
    @comment.forum_thread = @forum_thread
    if @comment.save
      redirect_to forum_thread_path(@forum_thread)
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      render json: comment, status: :ok
    else
      render json: { error: 'Failed to update comment' }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
