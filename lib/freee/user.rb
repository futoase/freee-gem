module Freee
  class User < Freee::Base
    def me
      client.get('/api/1/users/me')
    end

    def me_all
      client.get('/api/1/users/me?companies=true')
    end
  end
end
