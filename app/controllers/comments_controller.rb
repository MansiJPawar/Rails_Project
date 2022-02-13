class CommentsController < ApplicationController
    #creates comments for a post
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        redirect_to post_path(@post)
    end
    
    #delete comment
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
end
