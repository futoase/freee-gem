module Freee
  class Partner < Freee::Base
    def self.create
      #client.post('/api//1/partners')
    end

    def self.list
      Freee.client.get('/api/1/partners')
    end
  end
end
