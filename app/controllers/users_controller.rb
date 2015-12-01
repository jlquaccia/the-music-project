class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @hash_version_array = []

    # binding.pry
    @user.follows.each do |follow|
      response = HTTParty.get("https://api.spotify.com/v1/artists/#{follow.artist_id}/related-artists")
      @hash_version = JSON.parse(response.body)
      @artist_name = follow.artist_name

      @hash_version_array << @hash_version
    end

    @hash_version_array
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to root_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end