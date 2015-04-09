module Freee
  class Section < Freee::Base
    def self.create(json)
      params = Freee.encode_json(json)
      Freee.client.post('/api/1/sections', :section, params)
    end

    def self.list(company_id)
      Freee.client.get(
        "/api/1/sections?company_id=#{company_id.to_i}",
        :section
      )
    end
  end
end
