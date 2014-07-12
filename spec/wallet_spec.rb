require 'spec_helper'

describe Freee::Wallet do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:walletable_id) { get_walletable_id }
  let(:wallet) { Freee::Wallet }
  let(:response) do
    wallet.create(
      company_id: company_id,
      walletable_id: walletable_id,
      date: '2014-07-10',
      walletable_type: 'bank_account',
      amount: '1000000',
      entry_side: 'income'
    )['wallet_txn']
  end

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  describe 'should can be able to create instance' do
    subject { wallet.list(company_id) }
    it { is_expected.not_to be_nil }
    it { is_expected.to be_instance_of(Freee::Response::Wallet) }
  end

  describe 'should get information of wallet txns for the company' do
    subject { wallet.list(company_id) }
    
    it { is_expected.to include('wallet_txns') }
  end

  describe 'should get information of first wallet txns for the company' do
    subject { wallet.list(company_id)['wallet_txns'].first }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('id') }
    it { is_expected.to include('company_id') }
    it { is_expected.to include('amount') }
    it { is_expected.to include('balance') }
    it { is_expected.to include('description') }
    it { is_expected.to include('due_amount') }
    it { is_expected.to include('date') }
    it { is_expected.to include('entry_side') }
    it { is_expected.to include('walletable_type') }
    it { is_expected.to include('walletable_id') }
  end

  describe 'should get information of first wallet txns with walletable type' do
    subject do
      result = wallet.list(company_id, walletable_type: 'bank_account')['wallet_txns']
      result.map! { |x| x['walletable_type'] }
      Set.new(result).length
    end

    it { is_expected.not_to be_nil }
    it { is_expected.to eq 1 }
  end

  describe "should get information of one's wallet txns" do
    subject do
      wallet.list(company_id, limit: 2)['wallet_txns'].length
    end

    it { is_expected.not_to be_nil }
    it { is_expected.to eq 2 }
  end

  it "should set information of one's wallet txns" do
    expect(response).to include('id')
    expect(response).to include('company_id')
    expect(response).to include('walletable_id')
    expect(response).to include('date')
    expect(response).to include('walletable_type')
    expect(response).to include('amount')
    expect(response).to include('entry_side')

    expect(response['company_id']).to eq company_id.to_i
    expect(response['walletable_id']).to eq walletable_id.to_i
    expect(response['date']).to eq '2014-07-10'
    expect(response['walletable_type']).to eq 'bank_account'
    expect(response['amount']).to eq 1000000
    expect(response['entry_side']).to eq 'income'
  end
end
