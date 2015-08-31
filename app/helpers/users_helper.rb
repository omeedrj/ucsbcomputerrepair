module UsersHelper
	def admin_logged_in?
		current_user.role == "Admin" || current_user.role == "Top_Admin"
	end
end
