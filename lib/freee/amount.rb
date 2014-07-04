module Freee
  class Amount < Freee::Base
    def self.current_report
      Freee.client.get('/api/p/reports/amounts/current', :amount)
    end
  end
end
