module Freee
  class Item < Freee::Base
    def create
      #client.post('/api/1/items')
    end

    def self.list(company_id)
      Freee.client.get("/api/1/items?company_id=#{company_id.to_i}")
    end
  end
end
