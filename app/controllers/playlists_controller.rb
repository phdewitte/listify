class PlaylistsController < ApplicationController
  before_action :get_spotify_token

  def index
    playlists_response = SpotifyCaller.featured_playlists_populate(@token)
    @playlists = playlists_response['playlists']['items']
  end

  def show
    @playlist = SpotifyCaller.get_individual_playlist(@token, params[:user_id], params[:id])
  end

  private
    def get_spotify_token
      spot_auth_call = SpotifyCaller.spotify_authorize
      login_response = spot_auth_call.parsed_response
      @token = login_response['access_token']
    end
end