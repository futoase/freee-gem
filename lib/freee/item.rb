module Freee
  class Item < Freee::Base

    def self.create(json)
      params = Freee.encode_json(json)
      Freee.client.post('/api/1/items', :item, params)
    end

    def self.list(company_id)
      Freee.client.get(
        "/api/1/items?company_id=#{company_id.to_i}",
        :item
      )
    end
  end
end
