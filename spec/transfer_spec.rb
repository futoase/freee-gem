require 'spec_helper'

describe Freee::Transfer do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:transfer) { Freee::Transfer }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should be able to get client' do
    expect(transfer.list(company_id)).not_to be_nil
  end

  it 'should be get information of transfers for the company' do
    expect(transfer.list(company_id)).to include('transfers')
  end

  describe 'should be get information of first transfers for the company' do
    subject { transfer.list(company_id)['transfers'].first }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('id') }
    it { is_expected.to include('company_id') }
    it { is_expected.to include('date') }
    it { is_expected.to include('amount') }
    it { is_expected.to include('from_walletable_id') }
    it { is_expected.to include('from_walletable_type') }
    it { is_expected.to include('to_walletable_type') }
    it { is_expected.to include('to_walletable_id') }
    it { is_expected.to include('description') }
  end

  describe "should be get one's information of first transfers for the company" do
    subject { transfer.list(company_id, limit: 3)['transfers'].length }

    it { is_expected.not_to be_nil }
    it { is_expected.to eq 3 }
  end
end
