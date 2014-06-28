module Freee
  class Wallet < Freee::Base
    def self.create
      #client.post('/api/1/wallet_txns')
    end

    def self.list(company_id)
      Freee.client.get("/api/1/wallet_txns?company_id=#{company_id}")
    end
  end
end
