class PlaylistsController < ApplicationController
  def index
    spot_auth_call = SpotifyCaller.spotify_authorize
    login_response = spot_auth_call.parsed_response
    token = login_response['access_token']

    playlists_response = SpotifyCaller.featured_playlists_populate(token)
    @playlists = playlists_response['playlists']['items']
  end

  def show

  end
end