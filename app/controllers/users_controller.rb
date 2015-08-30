class UsersController < ApplicationController

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
				render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if !params[:current_password].empty?
			if User.find(params[:id]).authenticate(params[:current_password])
				if @user.update(user_params)
						redirect_to @user
				else
					render 'edit'
				end
			else
				@user.errors.add(:current_password_incorrect, "")
				render 'edit'
			end
		else
			if @user.update(user_params_no_passwords_or_email_or_role)
				redirect_to @user
			else
				render 'edit'
			end
		end
	end

	def destroy
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :role, :email, :username, :website_code, :password, :password_confirmation, :current_password )
		end

		def user_params_no_passwords_or_email_or_role
			params.require(:user).permit(:first_name, :last_name, :username )
		end

end
