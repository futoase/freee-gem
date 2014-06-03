module Freee
  class Amount < Freee::Base
    def current_report
      client.get('/api/p/reports/amounts/current')
    end
  end
end
