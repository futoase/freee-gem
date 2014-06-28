require 'spec_helper'

describe Freee::Item do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:item) { Freee::Item }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(item.list).to be_nil
  end
end
