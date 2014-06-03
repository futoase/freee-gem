require 'spec_helper'

describe Freee::Company do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { '12345' }
  let(:company) { Freee::Company.new }

  before(:each) do
    Freee::Base.config(config_id, secret_key)
  end

  it 'should can be able to create instance' do
    expect(company.list).not_to be_nil
  end

  it 'should be get list of company' do
    result = company.list
    expect(result).to include("companies")
    expect(result.first).to include("id")
    expect(result.first).to include("name")
    expect(result.first).to include("name_kana")
    expect(result.first).to include("display_name")
  end
  
  it 'should be get item of the company' do
    result = company.list_of_details(company_id)
    expect(result).to include("companies")
  end
end
