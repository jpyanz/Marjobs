class SessionController < ApplicationController
    def create
		@user = User.find_by(username: params[:username].downcase)

		if !!@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id

			redirect_to user_path(@user)
		else
			message = "Something went wrong!"
			redirect_to login_path, notice: message
		end
	end

	def destroy
    	session[:user_id] = nil 
		
		redirect_to login_path
	end
end
