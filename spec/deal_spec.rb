require 'spec_helper'

describe Freee::Deal do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:deal) { Freee::Deal }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(deal.list).not_to be_nil
  end
end
