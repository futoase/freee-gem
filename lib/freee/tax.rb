module Freee
  class Tax < Freee::Base
    def self.list(company_id)
      Freee.client.get(
        "/api/1/taxes?company_id=#{company_id.to_i}",
        :taxes
      )
    end

    def self.list_of_code
      Freee.client.get('/api/1/taxes/codes', :taxes)
    end
  end
end
