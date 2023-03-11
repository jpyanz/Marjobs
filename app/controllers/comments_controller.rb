class CommentsController < ApplicationController
	layout 'dashboard'
	before_action :authorize
	before_action :set_comment, only: %i[ show edit update destroy ]

	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def edit
	end

	def create
		@comment = Comment.new(comment_params)

		respond_to do |format|
			if @comment.save
				format.html { redirect_to gallery_show_path(@comment), notice: "Comment was successfully created." }
				format.json { render :show, status: :created, location: @comment }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @comment.update(comment_params)
				format.html { redirect_to comments_path, notice: "Comment was successfully updated." }
				format.json { render :show, status: :ok, location: @comment }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@comment.destroy

		respond_to do |format|
			format.html { redirect_to comments_url, notice: "Comment was successfully deleted." }
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

	def set_comment
		@comment = Comment.find(params[:id])
	end
	
	def comment_params
		params.require(:comment).permit(:name, :body, :status, :album_id)
	end
end
