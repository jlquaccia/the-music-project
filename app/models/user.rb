class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :follows, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  # Artists that users have followed
  def followed(artist)
    follows.where(artist_id: artist.id).first
  end

  # Top 10 tracks of all artists being followed by a user get added into the current_users playlist
  def followed_artist_tracks
    results = []
    follows.each do |follow|
      response = HTTParty.get("https://api.spotify.com/v1/artists/#{follow.artist_id}/top-tracks?country=US")
      @hash_version = JSON.parse(response.body)
      @hash_version["tracks"].each do |track|
        results << track["id"]
      end
    end

    results.shuffle.join(",")
  end

  # Grabs any upcoming concerts a followed artist may have that is near where the user lives
  # def followed_artist_dates
  #   results = []
  #   follows.each do |follow|
  #     response = HTTParty.get("http://api.bandsintown.com/artists/#{follow.artist_name}/events/search.json?api_version=2.0&app_id=YOUR_APP_ID&location=use_geoip")
  #     @hash_version = JSON.parse(response.body)
  #     @hash_version
  #   end
  # end
end