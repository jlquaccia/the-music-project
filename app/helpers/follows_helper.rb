module FollowsHelper
  def artist_name(artist_id)
    response = HTTParty.get("https://api.spotify.com/v1/artists/#{artist_id}")
    @hash_version = JSON.parse(response.body)
    results = []

    results << @hash_version["name"]

    results.join("")
  end
end