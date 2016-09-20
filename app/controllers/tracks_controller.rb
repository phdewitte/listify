class TracksController < ApplicationController
  def show
    track_response = SpotifyCaller.get_individual_track(params[:id])
    @track = track_response
  end
end