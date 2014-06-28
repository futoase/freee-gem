module Freee
  class Transfer < Freee::Base
    def self.create
      #client.post('/api/1/transfers')
    end

    def self.list
      Freee.client.get('/api/1/transfers')
    end
  end
end
