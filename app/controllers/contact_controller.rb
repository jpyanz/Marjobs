class ContactController < ApplicationController
  layout 'default'
  
	def index
	end

  	def submit
		name = params[:name]
		phone = params[:phone]
		email = params[:email]
		message = params[:message]

		ContactMailer.contact(name, phone, email, message).deliver

		flash[:notice] = "Message successfully sent!"

		redirect_to contact_path
	end
end
