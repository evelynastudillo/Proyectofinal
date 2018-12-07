class LikesController < ApplicationController
  before_action :authenticate_user!


  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post: @post, user:current_user)

    if @like.save!
      @post.likes.count
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    @post = @like.post
    redirect_to root_path(@post)
  end
end
