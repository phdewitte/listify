module SpotifyCaller
  def self.client_id
    Rails.application.secrets.spotify_client_id
  end

  def self.client_secret
    Rails.application.secrets.spotify_client_secret
  end

  def self.spotify_authorize
    p ENV["SPOTIFY_CLIENT_SECRET"]
    encoded_client = Base64.encode64(SpotifyCaller.client_id + ":" + SpotifyCaller.client_secret).delete("\n")

    HTTParty.post("https://accounts.spotify.com/api/token",
      :query => { :grant_type => "client_credentials" },
      :headers => { "Authorization" => "Basic " + encoded_client }
    )
  end

  def self.featured_playlists_populate(token)
    HTTParty.get("https://api.spotify.com/v1/browse/featured-playlists?country=US",
      :headers => { "Authorization" => "Bearer " + token }
    )
  end
end