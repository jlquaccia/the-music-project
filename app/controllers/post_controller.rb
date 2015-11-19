class PostController < ApplicationController
  def index
    require 'rubygems'
    require 'mechanize'
    require 'open-uri'

    @user = current_user
    @artist_name_array = []

    # grabbing all artist names from a users current follows
    @user.follows.each do |follow|
      @artist_name_array << follow["artist_name"]
    end
    
    # binding.pry
    @artist_name_array.each do |artist|
      agent = Mechanize.new
      page = agent.get("http://pitchfork.com/search/?query=#{artist}&filter=news")
      @base_url = "http://pitchfork.com"
      @href = page.search(".object-list h1 a")[0]["href"]
      @title = page.search(".object-list h1 a")[0].text
      @title_href = @base_url+@href
      @description = page.search(".object-list p")[0].text
      @date_and_time = page.search(".object-list h4")[0].text
    end
  end
end