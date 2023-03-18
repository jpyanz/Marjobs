class UsersController < ApplicationController
    layout 'dashboard'
    before_action :authorize
    before_action :set_user, only: %i[ show edit update destroy ]
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to users_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to users_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if @user.destroy
            redirect_to users_path, status: :see_other
        else
            render :index
        end
    end

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
        redirect_to login_path unless current_user
    end

    def set_user
		@user = User.find(params[:id])
	end

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
end
