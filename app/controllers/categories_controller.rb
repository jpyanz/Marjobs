class CategoriesController < ApplicationController
	layout 'dashboard'
	before_action :authorize
	before_action :set_category, only: %i[ show edit update destroy ]

	def index
		@categories = Category.all.order("created_at DESC")
	end

	def new
		@category = Category.new
	end

	def edit
	end
	
	def create
		@category = Category.new(category_params)

		respond_to do |format|
			if @category.save
				format.html { redirect_to categories_path, notice: "Category was successfully created." }
				format.json { render :show, status: :created, location: @category }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @category.update(category_params)
				format.html { redirect_to categories_path, notice: "Category was successfully updated." }
				format.json { render :show, status: :ok, location: @category }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
	end

  	def destroy
    	@category.destroy

    	respond_to do |format|
			format.html { redirect_to categories_url, notice: "Category was successfully deleted." }
			format.json { head :no_content }
    	end
  	end

  private
  	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def authorize
		redirect_to login_path unless current_user
	end

    def set_category
      	@category = Category.find(params[:id])
    end

    def category_params
      	params.require(:category).permit(:category)
    end
end
