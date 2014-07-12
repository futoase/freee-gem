module Freee
  class Wallet < Freee::Base
    def self.create(**kwargs)
      Freee.client.post('/api/1/wallet_txns', :wallet, **kwargs)
    end

    def self.list(company_id, **kwargs)
      params = Freee.encode_params(kwargs)
      Freee.client.get(
        "/api/1/wallet_txns?company_id=#{company_id.to_i}#{params}",
        :wallet
      )
    end
  end
end
