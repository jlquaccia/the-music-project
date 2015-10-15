class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    response = HTTParty.get("https://api.spotify.com/v1/artists/?ids=13ubrt8QOOCPljQ2FL1Kca,3TaUSUXn41GixL7zbvrIDt,7IDrRpDz0cOuUVC32c8PKD,4tKUoNubW02udXOh7SLtXV,3XHO7cRUPCLOr6jwp8vsx5,2VAnyOxzJuSAj7XIuEOT38,2fgl3me4n9diODTrVfruF3,2xe8IXgCTpwHE3eA9hTs4n,56ZTgzPBDge0OvCGgMO3OY,03r4iKL2g2442PT9n2UKsx")
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
    params.require(:user).permit(:name)
  end
end