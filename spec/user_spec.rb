require 'spec_helper'

describe Freee::User do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:user) { Freee::User.new }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(user.client).not_to be_nil
  end

  it 'should be get information of user' do
    result = user.me
    expect(result).to include("user")
    expect(result["user"]).not_to include("companies")
  end

  it 'should be get information of user at all' do
    result = user.me_all
    expect(result).to include("user")
    expect(result["user"]).to include("companies")
  end
end
