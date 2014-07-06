require 'oauth2'
require 'faraday'
require 'faraday_middleware'
require 'httpauth'
require 'thor'

$:.unshift(File.dirname(__FILE__))

require 'freee/base'
require 'freee/obj/response'

Freee.includes(__FILE__, 'freee/*')
Freee.includes(__FILE__, 'freee/obj/*')

module Freee
  OPTIONS = {
    site: 'https://api.freee.co.jp',
    authorize_url: '/oauth/authorize',
    token_url: '/oauth/token'
  }
end
