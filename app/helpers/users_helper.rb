module UsersHelper
	def admin_logged_in?
		current_user.role == "Admin" || current_user.role == "Top_Admin"
	end

  def viewOnlyAccount?
    logged_in? && current_user.username.downcase.include?("viewonly")
  end
end
