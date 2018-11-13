class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.new(comment_params)
    @comment.user = current_user
    @comment.save!
  end
  def show
    @comment = Comment.find(params[:id])
  end
  private def comment_params
    params.require(:comment).permit(:content)
  end
end
