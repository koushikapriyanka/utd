module ApplicationHelper

	def current_user
		return false if session[:user_id].blank?
		User.find(session[:user_id])
	end
end
