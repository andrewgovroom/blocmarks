class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
 
    if like.save
      flash[:notice] = "Bookmark Liked!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "Error Liking Bookmark. Please Try Again."
      redirect_to @bookmark.topic
    end
  end

  def destroy
     like = Like.find(params[:id])
     @bookmark = Bookmark.find(params[:bookmark_id])
 
     if like.destroy
       flash[:notice] = "Bookmark Unliked!"
       redirect_to @bookmark.topic
     else
       flash[:error] = "There Was an Error Unliking."
       redirect_to @bookmark.topic
     end
  end
  
end