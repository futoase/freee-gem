module Freee
  class Company < Freee::Base
    def self.list
      Freee.client.get('/api/1/companies', :company)
    end

    def self.list_of_details(company_id)
      Freee.client.get("/api/1/companies/#{company_id.to_i}", :company)
    end
  end
end
