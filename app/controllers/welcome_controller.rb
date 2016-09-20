class WelcomeController < ApplicationController
  def index
    spot_auth_call = SpotifyCaller.spotify_authorize
    @login_response = spot_auth_call.parsed_response
    token = @login_response['access_token']
    type = @login_response['type']

  end
end