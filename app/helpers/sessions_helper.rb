module SessionsHelper
	def admin?
		cookies[:remember_token] == ADMIN_REMEMBER_TOKEN
	end
end