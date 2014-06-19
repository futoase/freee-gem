require 'freee'

module Freee
  class Base

    @@client_id = nil
    @@secret_key = nil
    @@token = nil

    attr_reader :client

    def self.config(client_id, secret_key, token)
      @@client_id = client_id.to_s
      @@secret_key = secret_key.to_s
      @@token = token.to_s
    end

    def initialize; end

    def client
      @client = OAuth2::AccessToken.new(create_client, @@token)
      self
    end

    def token
      @@token
    end

    def token=(token)
      @@token = token
    end

    def get(path)
      @client.get(path).response.env[:body]
    end

    private
    def create_client
      OAuth2::Client.new(@@client_id, @@secret_key, OPTIONS) do |con|
        con.request :url_encoded
        con.request :json
        con.response :json, content_type: /\bjson$/
        con.adapter Faraday.default_adapter
      end
    end
  end
end
