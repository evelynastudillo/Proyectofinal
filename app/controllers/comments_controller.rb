class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    respond_to do |format|
      format.js
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
