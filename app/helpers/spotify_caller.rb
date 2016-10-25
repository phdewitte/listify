module SpotifyCaller
  def self.client_id
    Rails.application.secrets.spotify_client_id
  end

  def self.client_secret
    Rails.application.secrets.spotify_client_secret
  end

  def self.encoded_client
    Base64.encode64(SpotifyCaller.client_id + ":" + SpotifyCaller.client_secret).delete("\n")
  end

  def self.spotify_authorize
    HTTParty.post("https://accounts.spotify.com/api/token",
      :query => { :grant_type => "client_credentials" },
      :headers => { "Authorization" => "Basic " + self.encoded_client }
    )
  end

  def self.featured_playlists_populate(token)
    HTTParty.get("https://api.spotify.com/v1/browse/featured-playlists?country=US&limit=50",
      :headers => { "Authorization" => "Bearer " + token }
    )
  end

  def self.get_individual_playlist(token, user_id, playlist_id)
    HTTParty.get("https://api.spotify.com/v1/users/#{user_id}/playlists/#{playlist_id}/tracks",
      :headers => { "Authorization" => "Bearer " + token }
    )
  end

  def self.get_individual_track(track_id)
    HTTParty.get("https://api.spotify.com/v1/tracks/#{track_id}")
  end

  def self.get_album(album_id)
    HTTParty.get("https://api.spotify.com/v1/albums/#{album_id}")
  end
end