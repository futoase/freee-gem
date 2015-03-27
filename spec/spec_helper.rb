$:.unshift(File.realpath(File.dirname(__FILE__) + '/../lib'))
require 'set'
require 'webmock/rspec'
require 'freee'
require 'pry'

include WebMock::API
WebMock.disable_net_connect!(allow_localhost: true)

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file).read
end

def a_get(path)
  a_request(:get, Freee::OPTIONS[:site] + path)
end

def a_post(path)
  a_request(:post, Freee::OPTIONS[:site] + path)
end

def a_put(path)
  a_request(:put, Freee::OPTIONS[:site] + path)
end

def a_delete(path)
  a_request(:delete, Freee::OPTIONS[:site] + path)
end

def stub_get(path)
  stub_request(:get, Freee::OPTIONS[:site] + path)
end

def stub_post(path)
  stub_request(:post, Freee::OPTIONS[:site] + path)
end

def stub_put(path)
  stub_request(:put, Freee::OPTIONS[:site] + path)
end

def get_client_id
  ENV["FREEE_CLIENT_ID"]
end

def get_secret_key
  ENV["FREEE_SECRET_KEY"]
end

def get_token
  ENV["FREEE_APPLICATION_TOKEN"]
end

def get_redirect_url
  ENV["FREEE_REDIRECT_URL"]
end

def get_authorization_code
  ENV["FREEE_AUTHORIZATION_CODE"]
end

def get_company_id
  ENV["FREEE_COMPANY_ID"]
end

def get_walletable_id
  ENV["FREEE_WALLETABLE_ID"]
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
