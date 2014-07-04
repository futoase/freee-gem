require 'spec_helper'

describe Freee::Walletable do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:walletable) { Freee::Walletable }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  describe 'should can be able to create instance' do
    subject { walletable.list(company_id) }
    it { is_expected.not_to be_nil }
    it { is_expected.to be_instance_of(Freee::Response::Walletable) }
  end

  describe 'should get information of walletable for the company' do
    subject { walletable.list(company_id) }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('walletables') }
  end

  describe 'should get information of first walletable for the company' do
    subject { walletable.list(company_id)['walletables'].first }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('id') }
    it { is_expected.to include('name') }
    it { is_expected.to include('type') }
  end
end
