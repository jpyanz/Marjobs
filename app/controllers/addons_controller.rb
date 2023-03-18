class AddonsController < ApplicationController
  	layout 'dashboard'
	before_action :authorize
  	before_action :set_addon, only: %i[ show edit update destroy ]

	def index
		@addons = Addon.all.order("created_at DESC")
	end

	def new
		@addon = Addon.new
	end

	def edit
	end

	def create
		@addon = Addon.new(addon_params)

		respond_to do |format|
			if @addon.save
				format.html { redirect_to addons_path, notice: "Addon was successfully created." }
				format.json { render :show, status: :created, location: @addon }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @addon.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @addon.update(addon_params)
				format.html { redirect_to addons_path, notice: "Addon was successfully updated." }
				format.json { render :show, status: :ok, location: @addon }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @addon.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@addon.destroy

		respond_to do |format|
			format.html { redirect_to addons_url, notice: "Addon was successfully deleted." }
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
	
    def set_addon
      @addon = Addon.find(params[:id])
    end

    def addon_params
      params.require(:addon).permit(:name, :price)
    end
end
