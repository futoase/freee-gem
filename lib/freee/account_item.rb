module Freee
  class AccountItem < Freee::Base
    def self.list(company_id)
      Freee.client.get(
        "/api/1/account_items?company_id=#{company_id.to_i}",
        :account_item
      )
    end
  end
end
