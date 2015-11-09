class FollowsController < ApplicationController
  include FollowsHelper

  def create
    @artist = params[:artist_id]
    @artist_name = artist_name(@artist)
    @follower = Follow.create(artist_id: @artist, artist_name: @artist_name, user_id: params[:user_id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @artist = params[:artist_id]
    @follow = Follow.find(params[:id])
    @user_id = @follow.user_id

    respond_to do |format|
      format.html
      format.js
    end
  end
end