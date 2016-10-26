class PlaylistsController < ApplicationController
  before_action :get_spotify_token
  before_action :get_playlist_title, only: [:show]

  def index
    playlists_response = SpotifyCaller.get_featured_playlists(@token)
    @playlists = playlists_response['playlists']['items']
  end

  def show
    playlist_response = SpotifyCaller.get_individual_playlist(@token, params[:user_id], params[:id])
    @playlist = playlist_response['items']
  end

  private
    def get_spotify_token
      spot_auth_call = SpotifyCaller.spotify_authorize
      login_response = spot_auth_call.parsed_response
      @token = login_response['access_token']
    end

    def get_playlist_title
      @playlist_title = params[:playlist_title]
    end
end