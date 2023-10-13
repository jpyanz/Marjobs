class CheckoutController < ApplicationController
    layout 'default'

    def index
		@packages = Package.all.order("created_at ASC")
		@addons = Addon.all.order("created_at ASC")
		@categories = Package.all.order("created_at ASC").map { |package| package.category }.uniq - [""]
	end

	def new
		@booking = Booking.new
		@packages_name = Package.all.map { |package| [package.name] }
		@addons = Addon.all.order("created_at ASC")
    end

    def create
		@booking = Booking.new(booking_params)
		@addons = Addon.all.order("created_at ASC")

		@booking.addons = {}

		@addons.each.with_index(1) do |addon, i|
			@booking.addons.store(addon.id.to_s, params[:booking][addon.id.to_s]) unless params[:booking][addon.id.to_s] == 0.to_s
		end

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