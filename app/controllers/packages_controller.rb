class PackagesController < ApplicationController
    layout 'default'
  
    def index
    end

    def checkout
		package = params[:package]
		date = params[:date]
		name = params[:name]
		phone = params[:phone]
		email = params[:email]
		venue = params[:venue]
		addons = [
			params[:addon1],
			params[:addon2],
			params[:addon3],
			params[:addon4],
			params[:addon5],
			params[:addon6],
			params[:addon7],
			params[:addon8],
			params[:addon9]
		]

		CheckoutMailer.checkout(package, date, name, phone, email, venue, addons).deliver

		redirect_to packages_path
    end
end