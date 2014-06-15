require 'oauth2'
require 'faraday'
require 'faraday_middleware'
require 'httpauth'
require 'thor'

require 'freee/version'
require 'freee/base'

path = File.dirname(File.absolute_path(__FILE__))
Dir.glob(path + '/freee/*').each do |d|
  require d if FileTest.file?(d)
end

module Freee
  OPTIONS = {
    site: 'https://api.freee.co.jp',
    authorize_url: '/oauth/authorize',
    token_url: '/oauth/token'
  }
end
