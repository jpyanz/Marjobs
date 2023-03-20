class AlbumsController < ApplicationController
	layout 'dashboard'
	before_action :authorize
	before_action :set_album, only: %i[ show edit update destroy ]
	before_action :set_categories, only: %i[ show new edit create ]

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
		@album.files.purge

		respond_to do |format|
			format.html { redirect_to albums_path, notice: "Album was successfully deleted." }
			format.json { head :no_content }
		end
	end

	def delete_file
		@album = Album.find(params[:album_id])
		@image = ActiveStorage::Attachment.find(params[:id])
	  	@image.purge

		redirect_to edit_album_path(@album), notice: "File was successfully deleted." 
	end

	def delete_thumbnail
		@album = Album.find(params[:album_id])
		@thumbnail = ActiveStorage::Attachment.find(params[:id])
	  	@thumbnail.purge

		redirect_to edit_album_path(@album), notice: "Thumbnail was successfully deleted." 
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

	def set_categories
		@categories_array = Category.all.map { |category| [category.category] }
	end

	# Only allow a list of trusted parameters through.
	def album_params
		params.require(:album).permit(:title, :description, :thumbnail, :category, files: [])
	end
end
