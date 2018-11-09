class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @post.comments << @comment
    @comment.save!

    #def show
    #  @comment = Comment.find(params[:id])
    #end
    private def comment_params
      params.require(:comment).permit(:comment, :user_id)
    end
  end
end
