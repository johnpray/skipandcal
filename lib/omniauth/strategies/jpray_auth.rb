require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class JprayAuth < OmniAuth::Strategies::OAuth2
      option :name, :jpray_auth

      option :client_options, {
        site: ENV['OAUTH_PROVIDER_ROOT_URL'],
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        raw_info
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/current_user').parsed
      end
    end
  end
end