module Freee
  class WalletTxn < Freee::Base
    def self.create(json)
      params = Freee.encode_json(json)
      Freee.client.post('/api/1/wallet_txns', :wallet_txn, json)
    end

    def self.list(company_id, **kwargs)
      params = Freee.encode_params(kwargs)
      Freee.client.get(
        "/api/1/wallet_txns?company_id=#{company_id.to_i}#{params}",
        :wallet_txn
      )
    end
  end
end
