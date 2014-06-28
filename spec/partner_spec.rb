require 'spec_helper'

describe Freee::Partner do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:partner) { Freee::Partner }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(partner.list).not_to be_nil
  end
end
