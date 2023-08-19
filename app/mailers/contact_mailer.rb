class ContactMailer < ApplicationMailer
    default from: 'dimplez.yanzon@gmail.com'

    def contact(params) 
		@name =  params["name"]
		@phone = params["phone"]
		@email = params["email"]
		@message = params["message"]

		mail(to: 'dimplez.yanzon@gmail.com', subject: 'Contact Message from Marjobs.com')
	end
end
