class GalleryController < ApplicationController
  layout 'default'

  def index
    @albums = Album.all
  end

  def album
      @album = Album.find(params[:id])
  end
end
