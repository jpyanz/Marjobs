class CheckoutController < ApplicationController
    layout 'default'
	
    def index
    end

	def new
		@booking = Booking.new
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
			
			CheckoutMailer.checkout(booking_params, @booking.addons).deliver
			
			format.html { redirect_to checkout_confirmation_path }
			format.json { render :confirmation, status: :created, location: @booking }
		  else
			format.html { render :new, status: :unprocessable_entity }
			format.json { render json: @booking.errors, status: :unprocessable_entity }
		  end
		end
    end

	def confirmation
	end

	private

	# Only allow a list of trusted parameters through.
    def booking_params
		params.require(:booking).permit(:package, :date, :name, :phone, :email, :venue, addons: {})
	end
end