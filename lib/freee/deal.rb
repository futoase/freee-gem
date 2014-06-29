module Freee
  class Deal < Freee::Base
    def create
      #client.post('/api//1/deals')
    end

    def self.list(company_id)
      Freee.client.get("/api/1/deals?company_id=#{company_id.to_i}")
    end
  end
end
