class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    # comment.post_id = comment_params[:post_id]
    # comment.user_id = current_user.id
    # comment.save

    # redirect_back fallback_location: root_path
    redirect_to post_path(comment.post)
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.update(commnet_params) if comment
    redirect_to post_path(comment.post)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_back fallback_location: root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
