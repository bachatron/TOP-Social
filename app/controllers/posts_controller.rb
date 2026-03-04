class PostsController < ApplicationController
    before_action :authenticate_user!, only: [ :create, :destroy ]

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to @post
        else
            @user = current_user
            render "users/show", status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy
        redirect_to current_user
    end

    private

    def post_params
        params.require(:post).permit(:title, :body, :image)
    end
end
