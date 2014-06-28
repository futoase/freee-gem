require 'spec_helper'

describe Freee::Item do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:item) { Freee::Item }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(item.list(company_id)).not_to be_nil
  end

  describe 'should get information of first item for the company' do
    subject { item.list(company_id)['items'].first }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('id') }
    it { is_expected.to include('company_id') }
    it { is_expected.to include('name') }
    it { is_expected.to include('shortcut1') }
    it { is_expected.to include('shortcut2') }
  end
end
