module Freee
  class Walletable < Freee::Base
    def list
      client.get('/api/1/walletables')
    end
  end
end
