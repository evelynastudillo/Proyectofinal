class LikesController < ApplicationController
  before_action :find_post, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "No dos veces!"
    else
    @post.likes.create(user_id: current_user.id)
  end

def destroy
  if !(already_liked?)
    flash[:notice] = "No se puede eliminar"
  else
  @like.destroy
  redirect_to root_path(@post)
end

def find_like
  @like = @post.likes.find(params[:id])
end


  private
  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exits?
  end
  def find_post
    @post = Post.find(params[:post_id])
  end
end 
