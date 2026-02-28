class LikesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!, only: [ :create, :destroy ]

  def create
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to @post
    else
      redirect_to @post, alert: "Failed to like post"
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
