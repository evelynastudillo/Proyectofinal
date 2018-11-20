class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.create(post_id: params[:post_id], like: params[:like])
    @post = @like.post
    @like.save
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    redirect_to root_path(@post)
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  private
  def like_params
    params.permit :post_id
  end

end
