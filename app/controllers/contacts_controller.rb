class ContactsController < ApplicationController
	layout 'dashboard'
	before_action :authorize
  	before_action :set_contact, only: %i[ show edit update destroy ]

	def index
		@contacts = Contact.all.order("created_at DESC")
	end

	def new
		@contact = Contact.new
	end

	def edit
  	end

	def create
		@contact = Contact.new(contact_params)

		respond_to do |format|
			if @contact.save
				format.html { redirect_to contacts_url, notice: "Contact was successfully created." }
				format.json { render :show, status: :created, location: @contact }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @contact.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @contact.update(contact_params)
				format.html { redirect_to contacts_url, notice: "Contact was successfully updated." }
				format.json { render :show, status: :ok, location: @contact }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @contact.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@contact.destroy

		respond_to do |format|
			format.html { redirect_to contacts_url, notice: "Contact was successfully deleted." }
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

    def set_contact
      	@contact = Contact.find(params[:id])
    end

    def contact_params
      	params.require(:contact).permit(:name, :phone, :email, :message)
    end
end