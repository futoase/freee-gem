require 'spec_helper'

describe Freee::Company do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:company) { Freee::Company }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  describe 'should can be able to create instance' do
    subject { company.list }
    it { is_expected.not_to be_nil }
    it { is_expected.to be_instance_of(Freee::Response::Company) }
  end

  describe 'should be get first list of company' do
    subject { company.list["companies"].first }

    it { is_expected.to include('id') }
    it { is_expected.to include('name') }
    it { is_expected.to include('name_kana') }
    it { is_expected.to include('display_name') }
  end
  
  describe 'should be get item of the company' do
    subject { company.list_of_details(company_id) }

    it { is_expected.to include('company') }
  end

  describe 'should be get information of item for the company'  do
    subject { company.list_of_details(company_id)['company'] }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('id') }
    it { is_expected.to include('name') }
    it { is_expected.to include('name_kana') }
    it { is_expected.to include('display_name') }
    it { is_expected.to include('role') }
  end
end
