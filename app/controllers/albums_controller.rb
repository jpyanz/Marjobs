class AlbumsController < ApplicationController
	layout 'dashboard'
	before_action :authorize
	before_action :set_album, only: %i[ show edit update destroy ]
	
	def index
		@albums = Album.all.order("created_at DESC")
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
		@album.images.purge

		respond_to do |format|
			format.html { redirect_to albums_path, notice: "Album was successfully deleted." }
			format.json { head :no_content }
		end
	end

	def delete_image
		@album = Album.find(params[:album_id])
		@image = ActiveStorage::Attachment.find(params[:id])
	  	@image.purge

		redirect_to edit_album_path(@album), notice: "Image was successfully deleted." 
	end

	private

	def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
        redirect_to login_path unless current_user
    end

	# Run this on before_action
	def set_album
		@album = Album.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def album_params
		params.require(:album).permit(:name, :description, images: [])
	end
end
