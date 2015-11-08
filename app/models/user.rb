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
end