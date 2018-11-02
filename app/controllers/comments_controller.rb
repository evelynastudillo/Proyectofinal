class CommentsController < ApplicationController
  def index
  end

  def create
  @post = Post.find(params[:post_id])
  @comment = @post.comment.create(comment_params)
  @comment.user = current_user
  @comment.save

  def show
    @comment = Comment.find(params[:id])
  end
  private def comment_params
    params.require(:comments).permit(:content, :username)
  end
  end
end
