class GalleryController < ApplicationController
	layout 'default'

	def index
		@albums = Album.all
		@categories = Category.all
	end
	
	def show
		@album = Album.find(params[:id])
	end
end