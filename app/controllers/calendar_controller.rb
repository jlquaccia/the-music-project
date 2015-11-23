class CalendarController < ApplicationController
  require 'uri'

  def index
    @user = current_user
    @hash_version_array = []

    @user.follows.each do |follow|
      response = HTTParty.get("http://api.bandsintown.com/artists/#{URI.escape(follow.artist_name)}/events/search.json?api_version=2.0&app_id=el_proyecto_de_la_musica&location=use_geoip")
      @hash_version = JSON.parse(response.body)

      @hash_version_array << @hash_version if @hash_version != []
    end

    @hash_version_array
    # binding.pry
  end
end