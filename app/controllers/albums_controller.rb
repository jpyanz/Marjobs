class AlbumsController < ApplicationController
	layout 'dashboard'
	before_action :set_album, only: %i[ show edit update destroy ]

	def index
		@albums = Album.all
	end

	def show
	end

	def new
		@album = Album.new
	end

	def edit
	end

	def create
		@album = Album.new(album_params)

		respond_to do |format|
			if @album.save
				format.html { redirect_to album_url(@album), notice: "Album was successfully created." }
				format.json { render :show, status: :created, location: @album }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @album.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @album.update(album_params)
				format.html { redirect_to album_url(@album), notice: "Album was successfully updated." }
				format.json { render :show, status: :ok, location: @album }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @album.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@album.destroy

		respond_to do |format|
			format.html { redirect_to albums_path, notice: "Album was successfully deleted." }
			format.json { head :no_content }
		end
	end

	private
		# Run this on before_action
		def set_album
			@album = Album.find(params[:id])
		end

		# Only allow a list of trusted parameters through.
		def album_params
			params.require(:album).permit(:name, :description, images: [])
		end
end
