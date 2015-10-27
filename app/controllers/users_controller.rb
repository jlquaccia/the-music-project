class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    response = HTTParty.get("https://api.spotify.com/v1/artists/7oPftvlwr6VrsViSDV7fJY/top-tracks?country=US")
    @hash_version = JSON.parse(response.body)

    # binding.pry
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
    params.require(:user).permit(:name)
  end
end