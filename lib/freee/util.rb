module Freee
  module Util

    @@client = nil

    def self.create_params(**kwarg)
      {
        grant_type: 'authorization_code',
        code: kwarg[:authorization_code],
        redirect_uri: kwarg[:redirect_uri],
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => HTTPAuth::Basic.pack_authorization(
            kwarg[:client_id],
            kwarg[:secret_key]
          )
        }
      }
    end

    def self.create_client(**kwarg)
      @@client = OAuth2::Client.new(kwarg[:client_id], kwarg[:secret_key], OPTIONS) do |con|
        con.request :url_encoded
        con.request :json
        con.response :json, content_type: /\bjson$/
        con.adapter Faraday.default_adapter
      end
    end
    
    def self.create_token(**kwarg)
      self.create_client(kwarg) if @@client.nil?
      get_token = @@client.get_token(create_params(kwarg))
      {
        token: get_token.token,
        refresh_token: get_token.refresh_token
      }
    end

    def self.refresh_token(**kwarg)
      self.create_client(kwarg) if @@client.nil?
      get_token = OAuth2::AccessToken.from_hash(
        @@client,
        refresh_token: kwarg[:refresh_token]
      ).refresh!
      {
        token: get_token.token,
        refresh_token: get_token.refresh_token
      }
    end

    extend self
  end
end
