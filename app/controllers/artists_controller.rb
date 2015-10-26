class ArtistsController < ApplicationController
  def index
    request = search_params[:query]
    unless request.nil?
      response = HTTParty.get("https://api.spotify.com/v1/search?q="+request+"&type=artist")
      @hash_version = JSON.parse(response.body)
    end
  end

  private

  def search_params
    params.permit(:query, :utf8, :commit)
  end
end