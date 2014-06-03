require 'spec_helper'

describe Freee::Base do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:freee) { Freee::Base.new }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should be able to get client' do
    expect(freee.client).not_to be_nil
  end

  it 'should be call of get by Freee' do
    expect(freee.client.get('/api/1/users/me?companies=true')).to include("user")
  end
end
