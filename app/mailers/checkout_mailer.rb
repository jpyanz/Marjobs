class CheckoutMailer < ApplicationMailer
    default from: 'dimplez.yanzon@gmail.com'

    def checkout(package, date, name, phone, email, venue, addons)
        @package = package
        @date = date
        @name = name
        @phone = phone
        @email = email
        @venue = venue
        @addons = addons

        mail(to: 'brian.ocampo.official@gmail.com', subject: 'Order message from Marjobs.com')
    end
end
