module UsersHelper
	def admin_logged_in?
		current_user.role == "Admin" || current_user.role == "Head_Admin"
	end
end
