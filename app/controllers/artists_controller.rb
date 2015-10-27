class ArtistsController < ApplicationController
  def index
    request = search_params[:query]

    if request
      response = HTTParty.get("https://api.spotify.com/v1/search?q=#{CGI.escape request}&type=artist")
      @hash_version = JSON.parse(response.body)
    end
  end

  private

  def search_params
    params.permit(:query, :utf8, :commit)
  end
end