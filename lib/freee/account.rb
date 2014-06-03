module Freee
  class Account < Freee::Base
    def items(company_id)
      client.get("/api/1/account_items?company_id=#{company_id.to_i}")
    end
  end
end
