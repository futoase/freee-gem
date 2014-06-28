module Freee
  class Walletable < Freee::Base
    def self.list(company_id)
      Freee.client.get("/api/1/walletables?company_id=#{company_id}")
    end
  end
end
