class ArtistsController < ApplicationController
  def index
    request = search_params[:query]
    @hash_version_array = []

    if request
      response = HTTParty.get("https://api.spotify.com/v1/search?q=#{CGI.escape request}&type=artist")
      @hash_version = JSON.parse(response.body)

      @hash_version_array << @hash_version["artists"]["items"].sort { |a, b| b['followers']['total'] <=> a['followers']['total'] }
    end
  end

  private

  def search_params
    params.permit(:query, :utf8, :commit)
  end
end