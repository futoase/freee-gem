module Freee
  class Tax < Freee::Base
    def self.list
      Freee.client.get('/api/1/taxes')
    end

    def self.list_of_code
      Freee.client.get('/api/1/taxes/codes')
    end
  end
end
