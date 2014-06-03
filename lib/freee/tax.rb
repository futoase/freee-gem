module Freee
  class Tax < Freee::Base
    def list
      client.get('/api/1/taxes')
    end

    def list_of_code
      client.get('/api/1/taxes/codes')
    end
  end
end
