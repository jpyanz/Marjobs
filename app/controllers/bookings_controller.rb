class BookingsController < ApplicationController
	layout 'dashboard'
	before_action :authorize
	before_action :set_booking, only: %i[ show edit update destroy ]

	# GET /bookings or /bookings.json
	def index
		@bookings = Booking.all
	end

	# GET /bookings/1 or /bookings/1.json
	def show
	end

	# GET /bookings/new
	def new
		@booking = Booking.new
	end

	# GET /bookings/1/edit
	def edit
	end

	# POST /bookings or /bookings.json
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

	# PATCH/PUT /bookings/1 or /bookings/1.json
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
				format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
				format.json { render :show, status: :ok, location: @booking }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @booking.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /bookings/1 or /bookings/1.json
	def destroy
		@booking.destroy

		respond_to do |format|
			format.html { redirect_to bookings_path, notice: "Booking was successfully destroyed." }
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

	# Use callbacks to share common setup or constraints between actions.
	def set_booking
		@booking = Booking.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def booking_params
		params.require(:booking).permit(:package, :date, :name, :phone, :email, :venue, addons: {})
	end
end
