module Freee
  class Company < Freee::Base
    def create
      #client.post('/api/p/companies')
    end

    def list
      client.get('/api/1/companies')
    end

    def list_of_details(company_id)
      client.get("/api/1/companies/#{company_id.to_i}")
    end
  end
end
