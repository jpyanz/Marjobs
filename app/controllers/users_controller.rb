class UsersController < ApplicationController
    before_action :authorize

    layout 'default'
    
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])

        if @user.destroy
            redirect_to users_path, status: :see_other
        else
            render :show
        end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def authorize
        redirect_to login_path unless current_user
    end
    
    private
        def user_params
            params.require(:user).permit(:name, :username, :password)
        end
end
