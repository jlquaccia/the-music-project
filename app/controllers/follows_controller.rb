class FollowsController < ApplicationController
  include FollowsHelper

  def create
    @artist = params[:artist_id]
    @artist_name = artist_name(@artist)
    @follower = Follow.create(artist_id: @artist, artist_name: @artist_name, user_id: params[:user_id])

    if @follower.save
      flash[:notice] = "You're now following #{@artist_name}"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Failed to follow, please try again."
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @artist = params[:artist_id]
    @follow = Follow.find(params[:id])
    @artist_name = @follow.artist_name
    @user_id = @follow.user_id

    if @follow.destroy
      flash[:notice] = "You are no longer following #{@artist_name}"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Failed to unfollow, please try again."
      redirect_to user_path(current_user)
    end
  end

  def destroy_many

    Follow.where(id: params[:follow_ids]).delete_all

    render nothing: true
  end
end