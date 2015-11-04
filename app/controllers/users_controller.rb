class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @artist_id = current_user.follows.find_by(params[:artist_id])

    @user = User.find(params[:id])

    response = HTTParty.get("https://api.spotify.com/v1/artists/21mKp7DqtSNHhCAU2ugvUw/top-tracks?country=US")
    @hash_version = JSON.parse(response.body)
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