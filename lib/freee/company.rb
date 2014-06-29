module Freee
  class Company < Freee::Base
    def create
      #client.post('/api/p/companies')
    end

    def self.list
      Freee.client.get('/api/1/companies')
    end

    def self.list_of_details(company_id)
      Freee.client.get("/api/1/companies/#{company_id.to_i}")
    end
  end
end
