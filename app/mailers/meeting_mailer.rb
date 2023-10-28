class MeetingMailer < ApplicationMailer
    default from: 'marjobs.multimedia@gmail.com'

    def checkout(params)
        @category = params["category"]
        @other = params["other"]
        @date = params["date"]
        @name = params["name"]
        @contact = params["contact"]
        @email = params["email"]
        @preffered_date = params["preffered_date"]
        @details = params["details"]

        mail(to: 'marjobs.multimedia@gmail.com', subject: 'Client made a meeting schedule from marjobsinc.com')
    end
end
