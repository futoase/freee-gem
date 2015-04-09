module Freee
  class Tag < Freee::Base
    def self.create(json)
      params = Freee.encode_json(json)
      Freee.client.post('/api/1/tags', :tag, params)
    end

    def self.list(company_id)
      Freee.client.get(
        "/api/1/tags?company_id=#{company_id.to_i}",
        :tag
      )
    end
  end
end
