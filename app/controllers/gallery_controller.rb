class GalleryController < ApplicationController
	layout 'default'

	def index
		@albums = Album.all
		@comments = Comment.all
		@categories = Category.all
	end
	
	def show
		@album = Album.find(params[:id])
	end
end