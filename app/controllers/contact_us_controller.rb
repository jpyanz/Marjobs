class ContactUsController < ApplicationController
  	layout 'default'
  
	def index
		@contact = Contact.new
	end

  	def create
		@contact = Contact.new(contact_params)

		respond_to do |format|
			if @contact.save

				# TODO: uncomment in production 
				# ContactMailer.contact(contact_params).deliver

				format.html { redirect_to contact_us_path, notice: "Message was successfully sent!" }
				format.json { render :show, status: :created, location: @contact }
			else
				format.html { render contact_us_path, status: :unprocessable_entity }
				format.json { render json: @contact.errors, status: :unprocessable_entity }
			end
		end
	end

	private

    def contact_params
      	params.require(:contact).permit(:name, :phone, :email, :message)
    end
end
