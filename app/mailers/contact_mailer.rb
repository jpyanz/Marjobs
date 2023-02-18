class ContactMailer < ApplicationMailer
    default from: 'dimplez.yanzon@gmail.com'

    def contact(name, phone, email, message) 
		@name = name
		@phone = phone
		@email = email
		@message = message

		mail(to: 'brian.ocampo.official@gmail.com', subject: 'Contact Message from Marjobs.com')
	end
end
