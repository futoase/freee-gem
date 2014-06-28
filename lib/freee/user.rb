module Freee
  class User < Freee::Base
    def self.me
      Freee.client.get('/api/1/users/me')
    end

    def self.me_all
      Freee.client.get('/api/1/users/me?companies=true')
    end
  end
end
