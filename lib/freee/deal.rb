module Freee
  class Deal < Freee::Base
    def create
      #client.post('/api//1/deals')
    end

    def self.list(company_id, **kwargs)
      params = Freee.encode_params(kwargs)
      Freee.client.get("/api/1/deals?company_id=#{company_id.to_i}#{params}")
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
