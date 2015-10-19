class ArtistsController < ApplicationController
  def index
    response = HTTParty.get("https://api.spotify.com/v1/search?q=#{CGI.escape params[:query]}&type=artist")
    @hash_version = JSON.parse(response.body)
  end
end