class CheckoutMailer < ApplicationMailer
    default from: 'marjobs.multimedia@gmail.com'

    def checkout(params, addons)
        @package = params["package"]
        @date = params["date"]
        @name = params["name"]
        @phone = params["phone"]
        @email = params["email"]
        @venue = params["venue"]
        @addons = addons

        mail(to: 'marjobs.multimedia@gmail.com', subject: 'Client made a meeting schedule from marjobsinc.com')
    end
end
