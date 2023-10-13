class ContactMailer < ApplicationMailer
    default from: 'marjobs.multimedia@gmail.com'

    def contact(params)
		@name =  params["name"]
		@phone = params["phone"]
		@email = params["email"]
		@message = params["message"]

		mail(to: 'marjobs.multimedia@gmail.com', subject: 'Contact Message from marjobsinc.com')
	end
end
