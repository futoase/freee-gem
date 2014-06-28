require_relative 'spec_helper'

describe Freee::Account do
  let(:client_id) { get_token }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:account) { Freee::Account }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(account.items(company_id)).to include('account_items')
  end

  describe 'should be get information of account' do
    subject { account.items(company_id) }
    it { is_expected.to include('account_items') }
  end

  describe 'should be get information of account_items' do
    subject { account.items(company_id)['account_items'].first }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('id') }
    it { is_expected.to include('name') }
    it { is_expected.to include('shortcut') }
    it { is_expected.to include('default_tax_id') }
    it { is_expected.to include('categories') }
  end
end
