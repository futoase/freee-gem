require 'spec_helper'

describe Freee::Tax do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:tax) { Freee::Tax }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(tax.list(company_id)).not_to be_nil
  end

  describe 'should get item of tax for the company' do
    subject { tax.list(company_id) }

    it { is_expected.to include('taxes') } 
  end

  describe 'should get item of first tax for the company' do
    subject { tax.list(company_id)['taxes'].first }

    it { is_expected.to include('id') }
    it { is_expected.to include('name') }
  end

end
