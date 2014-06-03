module Freee
  class Transfer < Freee::Base
    def create
      #client.post('/api/1/transfers')
    end

    def list
      client.get('/api/1/transfers')
    end
  end
end
