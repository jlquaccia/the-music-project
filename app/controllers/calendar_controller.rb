class CalendarController < ApplicationController
  def index
    @user = current_user

    @user.follows.each do |follow|
      response = HTTParty.get("http://api.bandsintown.com/artists/#{CGI.escape follow.artist_name}/events/search.json?api_version=2.0&app_id=el_proyecto_de_la_musica&location=use_geoip")
      @hash_version = JSON.parse(response.body)

      # binding.pry
    end
  end

  def show
  end
end