module Freee
  class Walletable < Freee::Base
    def self.create(json)
      params = Freee.encode_json(json)
      Freee.client.post('/api/1/walletables', :walletable, params)
    end


    def self.list(company_id)
      Freee.client.get(
        "/api/1/walletables?company_id=#{company_id.to_i}",
        :walletable
      )
    end
  end
end
