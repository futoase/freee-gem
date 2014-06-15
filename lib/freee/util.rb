require 'freee'

module Freee
  module Util
    def self.create_token(**kwarg)

      client_id = kwarg[:client_id]
      secret_key = kwarg[:secret_key]
      client = OAuth2::Client.new(client_id, secret_key, OPTIONS) do |con|
        con.request :url_encoded
        con.request :json
        con.response :json, content_type: /\bjson$/
        con.adapter Faraday.default_adapter
      end

      params = {
        grant_type: 'authorization_code',
        code: kwarg[:authorization_code],
        redirect_uri: kwarg[:redirect_uri],
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => HTTPAuth::Basic.pack_authorization(
            client_id,
            secret_key
          )
        }
      }

      client.get_token(params).token
    end

    extend self
  end
end
