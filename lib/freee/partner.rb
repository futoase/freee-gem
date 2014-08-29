module Freee
  class Partner < Freee::Base
    def self.create
      Freee.client.post('/api/1/partners', :partner, **kwargs)
    end

    def self.list(company_id)
      Freee.client.get(
        "/api/1/partners?company_id=#{company_id.to_i}",
        :partner
      )
    end
  end
end
