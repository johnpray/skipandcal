class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private

    def admin
      if !admin?
        redirect_to root_path
      end
    end

    def oauth_client
      @oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: ENV['OAUTH_PROVIDER_ROOT_URL'])
    end

    def access_token
      if session[:access_token]
        @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
      end
    end
end
