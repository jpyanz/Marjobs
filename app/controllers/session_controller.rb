class SessionController < ApplicationController
	
	def index
	end
	
	def create
		@user = User.find_by(username: params[:username].downcase)

		if !!@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id

			redirect_to bookings_url
		else
			redirect_to login_path, notice: "You have entered an invalid username or password"
		end
	end

	def destroy
		session.delete(:user_id)
    	
		@user = nil
		
		redirect_to login_path, notice: "You have successfully logged out."
	end
end