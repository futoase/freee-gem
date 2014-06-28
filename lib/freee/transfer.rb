module Freee
  class Transfer < Freee::Base
    def self.create
      #client.post('/api/1/transfers')
    end

    def self.list(company_id)
      Freee.client.get("/api/1/transfers?company_id=#{company_id}")
    end
  end
end
