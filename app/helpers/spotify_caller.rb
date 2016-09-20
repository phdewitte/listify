module SpotifyCaller
  def self.client_id
    Rails.application.secrets.spotify_client_id
  end

  def self.client_secret
    Rails.application.secrets.spotify_client_secret
  end

  def self.spotify_authorize
    encoded_client = Base64.encode64("12f031a61c9a4fbe99af563a5d600b64:8a1e2faa3a534bd0a930616d7e592a3d").delete("\n")

    HTTParty.post("https://accounts.spotify.com/api/token",
      :query => { :grant_type => "client_credentials" },
      :headers => { "Authorization" => "Basic " + encoded_client }
    )
  end

  def self.featured_playlist_populate
    HTTParty.get("https://api.spotify.com/v1/browse/featured-playlists?country=US")
  end
end