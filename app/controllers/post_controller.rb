class PostController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'

    @user = current_user
    @base_url = 'http://pitchfork.com'

    @docs = {}

    @user.follows.each do |follow|
      artist_name = follow["artist_name"]
      @docs[artist_name] = Nokogiri::HTML(open("http://pitchfork.com/search/more/?query=#{URI.escape(artist_name)}&filter=news"))
    end
  end
end