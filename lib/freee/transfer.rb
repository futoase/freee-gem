module Freee
  class Transfer < Freee::Base
    def self.create
      Freee.client.post('/api/1/transfers', :transfer, **kwargs)
    end

    def self.list(company_id, **kwargs)
      params = Freee.encode_params(kwargs)
      Freee.client.get(
        "/api/1/transfers?company_id=#{company_id.to_i}#{params}",
        :transfer
      )
    end
  end
end
