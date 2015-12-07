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

    # grabbing the correct venue name for each artists show (currently only works for the last artist being iterated over)
    if @hash_version_array != [] do
      @hash_version_array.each do |date|
        @fb_rsvp_page = date[0]["facebook_rsvp_url"] if @fb_rsvp_page != []
        page = Nokogiri::HTML(open(@fb_rsvp_page))
        v = page.css(".event-venue a")[0].text
        c = page.css(".event-venue a")[1].text
        
        @venue = v.gsub(/[&]/, 'and')
        @city = c.gsub(/[&]/, 'and')
      end
    end

    @hash_version_array
  end

  # def map
  #   @user = current_user
  # end
end

# NOTE: request.ip will ONLY work in production, it does not work in development.  use_geoip WILL work in development but NOT in production.

# returns the current users ip address
# request.ip

# returns the current users city /// works b/c of the geocoder gem
# request.location.try(:city) /// works b/c of the geocoder gem