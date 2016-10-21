class TracksController < ApplicationController
  def show
    @track = SpotifyCaller.get_individual_track(params[:id])
  end
end