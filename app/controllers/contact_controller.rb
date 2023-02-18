class ContactController < ApplicationController
  layout 'default'
  
  def index
	name = params[:name]
	phone = params[:phone]
	email = params[:email]
	message = params[:message]

    ContactMailer.contact(name, phone, email, message).deliver
  end
end
