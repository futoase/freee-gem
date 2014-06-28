module Freee
  class Wallet < Freee::Base
    def self.create
      #client.post('/api/1/wallet_txns')
    end

    def self.list
      Freee.client.get('/api/1/wallet_txns')
    end
  end
end
