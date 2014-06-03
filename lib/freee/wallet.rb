module Freee
  class Wallet < Freee::Base
    def create
      #client.post('/api/1/wallet_txns')
    end

    def list
      client.get('/api/1/wallet_txns')
    end
  end
end
