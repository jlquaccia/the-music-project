class PostController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'

    @user = current_user
    @artist_name_array = []

    # grabbing all artist names from a users current follows
    @user.follows.each do |follow|
      @artist_name_array << follow["artist_name"]
    end
    
    # binding.pry
    url = 'http://pitchfork.com/search/more/?query=green%20day&filter=news'
    @base_url = 'http://pitchfork.com'
    @doc = Nokogiri::HTML(open(url))
  end
end