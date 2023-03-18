class PackagesController < ApplicationController
	layout 'dashboard'
	before_action :authorize
	before_action :set_package, only: %i[ show edit update destroy ]

	def index
		@packages = Package.all.order("created_at DESC")
	end

	def show
	end

	def new
		@package = Package.new
	end

	def edit
	end

	def create
		@package = Package.new(package_params)

		respond_to do |format|
			if @package.save
				format.html { redirect_to packages_path, notice: "Package was successfully created." }
				format.json { render :show, status: :created, location: @package }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @package.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @package.update(package_params)
				format.html { redirect_to packages_path, notice: "Package was successfully updated." }
				format.json { render :show, status: :ok, location: @package }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @package.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@package.destroy

		respond_to do |format|
			format.html { redirect_to packages_url, notice: "Package was successfully deleted." }
			format.json { head :no_content }
		end
	end

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def authorize
		redirect_to login_path unless current_user
	end

	def set_package
		@package = Package.find(params[:id])
	end

	def package_params
		params.require(:package).permit(:name, :price, :description, :freebies)
	end
end
