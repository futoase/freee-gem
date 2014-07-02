require 'oauth2'
require 'faraday'
require 'faraday_middleware'
require 'httpauth'
require 'thor'

$:.unshift(File.dirname(__FILE__))
require 'freee/version'
require 'freee/base'
require 'freee/account'
require 'freee/amount'
require 'freee/company'
require 'freee/deal'
require 'freee/item'
require 'freee/partner'
require 'freee/tax'
require 'freee/transfer'
require 'freee/user'
require 'freee/util'
require 'freee/wallet'
require 'freee/walletable'

require 'freee/obj/response'
require 'freee/obj/account'

module Freee
  OPTIONS = {
    site: 'https://api.freee.co.jp',
    authorize_url: '/oauth/authorize',
    token_url: '/oauth/token'
  }
end
