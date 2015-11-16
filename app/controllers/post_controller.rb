class PostController < ApplicationController
  def index
    require 'rubygems'
    require 'mechanize'
    require 'open-uri'

    @user = current_user

    agent = Mechanize.new
    artist = "Tycho"
    page = agent.get("http://pitchfork.com/search/?query=#{artist}&filter=news")
    @base_url = "http://pitchfork.com"
    @href = page.search(".object-list h1 a")[0]["href"]
    @title = page.search(".object-list h1 a")[0].text
    @title_href = @base_url+@href
    @description = page.search(".object-list p")[0].text
    @date_and_time = page.search(".object-list h4")[0].text
  end
end