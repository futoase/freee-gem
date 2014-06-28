require 'spec_helper'

describe Freee::Amount do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:amount) { Freee::Amount }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(amount.current_report).not_to be_nil
  end

  describe 'should be get information of amount by current' do
    subject { amount.current_report }

    it { is_expected.to include('company_id') }
    it { is_expected.to include('start_date') }
    it { is_expected.to include('end_date') }
  end
end
