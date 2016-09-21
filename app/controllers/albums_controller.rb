class AlbumsController < ApplicationController
  def show
    @album = SpotifyCaller.get_album(params[:id])
  end
end