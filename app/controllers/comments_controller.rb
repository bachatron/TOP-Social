class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [ :create, :destroy ]

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user = current_user

        @comment.save
        redirect_to @post
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        @comment.destroy
        redirect_to Post.find(params[:post_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
