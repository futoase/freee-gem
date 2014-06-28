$:.unshift(File.realpath(File.dirname(__FILE__) + '/../lib'))

require 'freee'

#Dir.glob(File.realpath(File.dirname(__FILE__) + '/../lib/freee') + '/**') do |freee|
#  require freee
#end

SAMPLE = YAML.load_file(File.expand_path('./sample.yml', __dir__))

def get_client_id
  SAMPLE["client_id"]
end

def get_secret_key
  SAMPLE["secret_key"]
end

def get_token
  SAMPLE["token"]
end

def get_redirect_url
  SAMPLE["redirect_url"]
end

def get_authorization_code
  SAMPLE["get_authorization_code"]
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
