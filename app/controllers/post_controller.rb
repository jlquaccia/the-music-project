class PostController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'

    @user = current_user
    @base_url = 'http://pitchfork.com'
    @artist_name_array = []

    # grabbing all artist names from a users current follows
    @user.follows.each do |follow|
      @artist_name_array << follow["artist_name"]
    end

    @artist_name_array.each do |artist_name|
      @doc = Nokogiri::HTML(open("http://pitchfork.com/search/more/?query=#{URI.escape(artist_name)}&filter=news"))
      @artist_name = artist_name
    end
    
    # binding.pry
    # url = "http://pitchfork.com/search/more/?query=#{URI.escape(@artist_name)}&filter=news"
    # @doc = Nokogiri::HTML(open(url))
  end
end