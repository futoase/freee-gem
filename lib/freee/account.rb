module Freee
  class Account < Freee::Base
    def self.items(company_id)
      Freee.client.get("/api/1/account_items?company_id=#{company_id.to_i}")
    end
  end
end
