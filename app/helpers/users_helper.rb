module UsersHelper
	def admin_logged_in?
		current_user.role == "Admin"
	end
end
