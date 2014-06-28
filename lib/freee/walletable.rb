module Freee
  class Walletable < Freee::Base
    def self.list
      Freee.client.get('/api/1/walletables')
    end
  end
end
