module Freee
  class Deal < Freee::Base

    def self.create(json)
      params = Freee.encode_json(json)
      Freee.client.post('/api//1/deals', :deal, params)
    end

    def self.list(company_id, **kwargs)
      params = Freee.encode_params(kwargs)
      Freee.client.get(
        "/api/1/deals?company_id=#{company_id.to_i}#{params}",
        :deal
      )
    end

    def self.list_income(company_id, **kwargs)
      kwargs[:type] = 'income'
      self.list(company_id, **kwargs)
    end

    def self.list_expense(company_id, **kwargs)
      kwargs[:type] = 'expense'
      self.list(company_id, **kwargs)
    end
  end
end
