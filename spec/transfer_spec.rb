require 'spec_helper'

describe Freee::Transfer do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:transfer) { Freee::Transfer.new }

  before(:each) do
    Freee::Base.config(config_id, secret_key, token)
  end

  it 'should be able to get client' do
    expect(transfer.list).not_to be_nil
  end
end
