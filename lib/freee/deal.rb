module Freee
  class Deal < Freee::Base
    def create
      #client.post('/api//1/deals')
    end

    def list
      client.get('/api/1/deals')
    end
  end
end
