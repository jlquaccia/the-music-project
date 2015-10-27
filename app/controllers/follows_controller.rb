class FollowsController < ApplicationController
  def create
    @artist = params[:artist_id]
    @follower = Follow.create(artist_id: @artist, user_id: params[:user_id])

    if @follower.save
      flash[:notice] = "Followed"
      redirect_to artists_path
    else
      flash[:error] = "Failed to follow, please try again."
      redirect_to artists_path
    end
  end

  def destroy
    @artist = params[:artist_id]
    @follow = Follow.find(params[:id])
    @user_id = @follow.user_id

    if @follow.destroy
      flash[:notice] = "Unfollowed"
      redirect_to artists_path
    else
      flash[:error] = "Failed to unfollow, please try again."
      redirect_to artists_path
    end
  end
end