$:.unshift(File.realpath(File.dirname(__FILE__) + '/../lib'))

require 'freee'

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

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
