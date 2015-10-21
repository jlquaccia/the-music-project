class FollowsController < ApplicationController
  def create
    artist = Artist.find(params[:artist_id])
    follow = current_user.follows.build(artist: artist)

    if follow.save
      flash[:notice] = "Followed"
      redirect_to artists_path
    else
      flash[:error] = "Failed to follow, please try again."
      redirect_to artists_path
    end
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    follow = current_user.follows.find(params[:id])

    if follow.destroy
      flash[:notice] = "Unfollowed"
      redirect_to artists_path
    else
      flash[:error] = "Failed to unfollow, please try again."
      redirect_to artists_path
    end
  end
end