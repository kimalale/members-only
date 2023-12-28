class CommentsController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
