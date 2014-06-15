require 'freee/version'
require 'freee/util'
require 'oauth2'
require 'faraday'
require 'faraday_middleware'
require 'httpauth'
require 'thor'

$:.unshift(File.dirname(__FILE__))

module Freee
  OPTIONS = {
    site: 'https://api.freee.co.jp',
    authorize_url: '/oauth/authorize',
    token_url: '/oauth/token'
  }
end
