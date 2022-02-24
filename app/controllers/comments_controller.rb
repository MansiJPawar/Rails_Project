class CommentsController < ApplicationController
  before_action :set_sport
  before_action :set_post

  #creates comments for a post
    def create
      @comment = @post.comments.create(params[:comment].permit(:name, :body, :sport_id, :post_id))
      redirect_to sport_posts_path(@sport, @post)
    # rescue NoMethodError => e
    #   print_exception(e, true)
    end
    
    #delete comment
    def destroy
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to sport_posts_path(@sport, @post)
    end

    private
      #to get sport object#nested route
      def set_sport
        @sport = Sport.find(params[:sport_id])
      end

       #to get post object #nested route
      def set_post
        @post = @sport.posts.find(params[:post_id])
      end
    
end
