require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Smartcloud < OmniAuth::Strategies::OAuth2

      option :client_options, {
          :site => 'https://apps.lotuslive.com',
          :authorize_url => 'https://apps.lotuslive.com/manage/oauth2/authorize',
          :token_url => 'https://apps.lotuslive.com/manage/oauth2/token'
      }
      option :provider_ignores_state, true

      option :token_options, {
          :grant_type => 'authorization_code'
      }

      option :access_token_options, {
          :header_format => 'Bearer %s'
      }

      def request_phase
        redirect client.auth_code.authorize_url({:callback_uri => callback_url}.merge(authorize_params))
      end

      def authorize_params
        params = options.authorize_params.merge(options.authorize_options.inject({}){|h,k| h[k.to_sym] = options[k] if options[k]; h})
        if OmniAuth.config.test_mode
          @env ||= {}
          @env['rack.session'] ||= {}
        end
        params
      end

      def build_access_token
        verifier = request.params['code']
        client.auth_code.get_token(verifier, {:callback_uri => callback_url}.merge(token_params.to_hash(:symbolize_keys => true)))
      end

      uid { raw_info['objectId'].to_s }

      info do
        {
          'name' => raw_info['fullName'],
          'email' => raw_info['emailAddress'],
          'country' => raw_info['country']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/lotuslive-shindig-server/social/rest/people/@me/@self?mode=json').parsed['entry']
      end
    end
  end
end

OmniAuth.config.add_camelization 'smartcloud', 'Smartcloud'
