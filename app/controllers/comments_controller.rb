class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  #def new
  #  @comment = Comment.new
  #end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id
    @comment.save!
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private def comment_params
    params.require(:comment).permit(:content)
  end
end
