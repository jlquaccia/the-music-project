class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @hash_version_array = []

    @user.follows.each do |follow|
      response = HTTParty.get("https://api.spotify.com/v1/artists/#{follow.artist_id}/related-artists")
      @hash_version = JSON.parse(response.body)
      @artist_name = follow.artist_name

      @hash_version_array << @hash_version['artists']
    end

    # clean up the @hash_version_array into 1 array of hashes that deals with all of the current artists a user is following
    @final_array = []

    @hash_version_array.map do |subarray|
      subarray.map do |subsubarray|
        @final_array << subsubarray
      end
    end

    @sorted = @final_array.sort { |a,b| b['followers']['total'] <=> a['followers']['total'] }

    # do not display any duplicate recommendations
    @final_sort = @sorted.uniq[0...50]
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