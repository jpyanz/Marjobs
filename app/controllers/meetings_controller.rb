class MeetingsController < ApplicationController
    layout 'dashboard'
    before_action :authorize
    before_action :set_meeting, only: %i[ show edit update destroy ]
	before_action :set_categories, only: %i[ show new edit create ]

    def index
        @meetings = Meeting.all
    end

    def show
    end

    def new
        @meeting = Meeting.new
    end

    def edit
    end

    def create
        @meeting = Meeting.new(meeting_params)

        respond_to do |format|
            if @meeting.save
                format.html { redirect_to meetings_url, notice: "Meeting was successfully created." }
                format.json { render :show, status: :created, location: @meeting }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @meeting.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /meetings/1 or /meetings/1.json
    def update
        respond_to do |format|
            if @meeting.update(meeting_params)
                format.html { redirect_to meetings_url, notice: "Meeting was successfully updated." }
                format.json { render :show, status: :ok, location: @meeting }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @meeting.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /meetings/1 or /meetings/1.json
    def destroy
        @meeting.destroy

        respond_to do |format|
            format.html { redirect_to meetings_url, notice: "Meeting was successfully deleted." }
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

    def set_meeting
        @meeting = Meeting.find(params[:id])
    end

    def set_categories
		@categories_array = Category.all.map { |category| [category.category] }
        @categories_array.append("Others")
	end

    def meeting_params
        params.require(:meeting).permit(:status, :category, :other, :date, :name, :contact, :email, :preffered_date, :details)
    end
end
