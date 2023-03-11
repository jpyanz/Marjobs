class BookingsController < ApplicationController
	layout 'dashboard'
	before_action :authorize
	before_action :set_booking, only: %i[ show edit update destroy ]

	def index
		@bookings = Booking.all.order("created_at DESC")
	end

	def new
		@booking = Booking.new
	end

	def edit
	end

	def create
		@booking = Booking.new(booking_params)

		@booking.addons = {
			1 => params[:booking]['addon1'],
			2 => params[:booking]['addon2'],
			3 => params[:booking]['addon3'],
			4 => params[:booking]['addon4'],
			5 => params[:booking]['addon5'],
			6 => params[:booking]['addon6'],
			7 => params[:booking]['addon7'],
			8 => params[:booking]['addon8'],
			9 => params[:booking]['addon9']
		}

		respond_to do |format|
		if @booking.save
				format.html { redirect_to bookings_url, notice: "Booking was successfully created." }
				format.json { render :show, status: :created, location: @booking }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @booking.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@booking.addons = {
			1 => params[:booking]['addon1'],
			2 => params[:booking]['addon2'],
			3 => params[:booking]['addon3'],
			4 => params[:booking]['addon4'],
			5 => params[:booking]['addon5'],
			6 => params[:booking]['addon6'],
			7 => params[:booking]['addon7'],
			8 => params[:booking]['addon8'],
			9 => params[:booking]['addon9']
		}

		respond_to do |format|
			if @booking.update(booking_params)
				format.html { redirect_to bookings_url, notice: "Booking was successfully updated." }
				format.json { render :show, status: :ok, location: @booking }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @booking.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@booking.destroy

		respond_to do |format|
			format.html { redirect_to bookings_path, notice: "Booking was successfully deleted." }
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

	def set_booking
		@booking = Booking.find(params[:id])
	end
	
	def booking_params
		params.require(:booking).permit(:package, :date, :name, :phone, :email, :venue, :status, addons: {})
	end
end
