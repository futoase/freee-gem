module Freee
  class Item < Freee::Base
    def create
      #client.post('/api/1/items')
    end

    def self.list
      Freee.client.get('/api/1/items')
    end
  end
end
