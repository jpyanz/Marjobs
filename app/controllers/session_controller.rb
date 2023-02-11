class SessionController < ApplicationController
	def create
		@user = User.find_by(username: params[:username].downcase)

		if !!@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id

			redirect_to user_path(@user)
		else
			redirect_to login_path, notice: "Something went wrong!"
		end
	end

	def destroy
		session.delete(:user_id)
    	
		@user = nil
		
		redirect_to login_path, notice: "You have successfully logged out."
	end
end