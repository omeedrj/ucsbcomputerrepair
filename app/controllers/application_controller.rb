class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper

  before_filter :delete_unlock_new_session_name

  private
  	def delete_unlock_new_session_name
			session.delete(:unlock_new_repair_employee_name)
		end
end
