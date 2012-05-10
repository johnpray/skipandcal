if Rails.env == "development"
	ADMIN_USERNAME = Rails.root.join("config/admin_username.txt").read
	ADMIN_PASSWORD = Rails.root.join("config/admin_password.txt").read
	ADMIN_REMEMBER_TOKEN = Rails.root.join("config/admin_remember_token.txt").read
else
  ADMIN_USERNAME  = ENV['ADMIN_USERNAME']
	ADMIN_USERNAME  = ENV['ADMIN_PASSWORD']
	ADMIN_REMEMBER_TOKEN  = ENV['ADMIN_REMEMBER_TOKEN']
end