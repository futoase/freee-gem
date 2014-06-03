require 'spec_helper'

describe Freee::Amount do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:amount) { Freee::Amount.new }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(amount.current_report).not_to be_nil
  end

  it 'should be get information of amount by current' do
    result = amount.current_report
    expect(result).to include("company_id")
    expect(result).to include("start_date")
    expect(result).to include("end_date")
  end
end
