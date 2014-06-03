require 'spec_helper'

describe Freee::Account do
  let(:client_id) { get_token }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { '12345' }
  let(:account) { Freee::Account.new }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(account.items(company_id)).to be_nil
  end

  it 'should be get information of account' do
    result = account.items(company_id)

    expect(result).to include("account_items")
  end
end
