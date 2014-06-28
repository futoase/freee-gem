module Freee
  class Partner < Freee::Base
    def self.create
      #client.post('/api//1/partners')
    end

    def self.list(company_id)
      Freee.client.get("/api/1/partners?company_id=#{company_id.to_s}")
    end
  end
end
