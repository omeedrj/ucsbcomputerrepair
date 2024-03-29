class UsersController < ApplicationController
before_filter :login_required
before_filter :admin_approval, :only => [:new, :create, :admin_edit_employee]
before_filter :redirectForViewOnlyAccount, only: [:update, :destroy]

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
			render 'new'
	end
end

def edit
	if User.exists?(params[:id]) && current_user.id == User.find(params[:id]).id
		@user = User.find(params[:id])
	else
		redirect_to users_path
	end
end

def admin_edit_employee
	if User.exists?(params[:id])
		@user = User.find(params[:id])
		if current_user.role == "Top_Admin"
			@user
		elsif @user.role == "Admin" || @user.role == "Top_Admin"
			redirect_to users_path
		else
			@user
		end
	else
		# flash: user does not exist
		redirect_to users_path
	end
end

def update
	@user = User.find(params[:id])
	if !params[:current_password].nil? && !params[:current_password].empty? 
		if User.find(params[:id]).authenticate(params[:current_password])
			if @user.update(user_params)
				redirect_to users_path
			else
				render 'edit'
			end
		else
			@user.errors.add(:current_password_incorrect, "")
			render 'edit'
		end
	else
		if @user.id != current_user.id && admin_logged_in?
			if @user.update(user_params)
				redirect_to users_path
			else
				render 'admin_edit_employee'
			end
		else
			if @user.update(user_params_no_passwords_or_email_or_role)
				redirect_to users_path
			else
				render 'edit'
			end
		end
	end
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	# flash: user deleted
	redirect_to users_path
end

private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :role, :email, :username, :website_code, :password, :password_confirmation, :current_password, :admin_edit )
	end

	def user_params_no_passwords_or_email_or_role
		params.require(:user).permit(:first_name, :last_name, :username, :admin_edit )
	end

	def login_required
		redirect_to login_path unless logged_in?
	end

	def admin_approval
		redirect_to users_path unless admin_logged_in?
	end

end
