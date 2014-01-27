require File.expand_path('lib/omniauth/strategies/jpray_auth', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jpray_auth,  ENV["OAUTH_ID"], ENV["OAUTH_SECRET"]
end