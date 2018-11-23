class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post: @post, user:current_user)
    @like.save!
    
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    redirect_to root_path(@post)
  end

  def like_params
    params.require(:likes).permit(:user_id, :post_id)
  end
end
