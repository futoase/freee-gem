module Freee
  class Partner < Freee::Base
    def create
      #client.post('/api//1/partners')
    end

    def list
      client.get('/api/1/partners')
    end
  end
end
