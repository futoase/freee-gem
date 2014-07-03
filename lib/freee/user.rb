module Freee
  class User < Freee::Base
    def self.me
      Freee.client.get('/api/1/users/me', :user)
    end

    def self.me_all
      Freee.client.get('/api/1/users/me?companies=true', :user)
    end
  end
end
