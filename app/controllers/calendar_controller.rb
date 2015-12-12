class CalendarController < ApplicationController
  require 'uri'

  def index
    require 'nokogiri'
    require 'open-uri'

    @user = current_user
    @hash_version_array = []

    @user.follows.each do |follow|
      # production
      response = HTTParty.get("http://api.bandsintown.com/artists/#{URI.escape(follow.artist_name)}/events/search.json?api_version=2.0&app_id=el_proyecto_de_la_musica&location=#{request.ip}")

      # development
      # response = HTTParty.get("http://api.bandsintown.com/artists/#{URI.escape(follow.artist_name)}/events/search.json?api_version=2.0&app_id=el_proyecto_de_la_musica&location=use_geoip")

      @hash_version = JSON.parse(response.body)
      @hash_version_array << @hash_version if @hash_version != []
    end

    @final_array = []

    @hash_version_array.each do |subarray|
      subarray.each do |third_array|
        @final_array << third_array
      end
    end

    @final_sort = @final_array.sort { |a,b| a['datetime'] <=> b['datetime'] }

    # binding.pry
  end
end

# NOTE: request.ip will ONLY work in production, it does not work in development.  use_geoip WILL work in development but NOT in production.

# returns the current users ip address
# request.ip

# returns the current users city /// works b/c of the geocoder gem
# request.location.try(:city) /// works b/c of the geocoder gem