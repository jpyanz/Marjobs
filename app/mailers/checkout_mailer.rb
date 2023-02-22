class CheckoutMailer < ApplicationMailer
    default from: 'dimplez.yanzon@gmail.com'

    def checkout(params, addons)
        @package = params["package"]
        @date = params["date"]
        @name = params["name"]
        @phone = params["phone"]
        @email = params["email"]
        @venue = params["venue"]
        @addons = addons
        
        mail(to: 'brian.ocampo.official@gmail.com', subject: 'Booking order message from Marjobs.com')
    end
end
