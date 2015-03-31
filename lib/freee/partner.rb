module Freee
  class Partner < Freee::Base

    def self.create(json)
      params = Freee.encode_json(json)
      Freee.client.post('/api/1/partners', :partner, params)
    end

    def self.list(company_id)
      Freee.client.get(
        "/api/1/partners?company_id=#{company_id.to_i}",
        :partner
      )
    end
  end
end
