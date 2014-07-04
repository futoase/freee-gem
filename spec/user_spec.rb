require 'spec_helper'

describe Freee::User do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:user) { Freee::User }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  describe 'should be get information of user' do
    subject { user.me }
    it { is_expected.not_to be_nil }
    it { is_expected.to be_instance_of(Freee::Response::User) }
    it { is_expected.to include('user') }
  end

  it 'should be get information of user at all' do
    result = user.me_all
    expect(result).to include('user')
    expect(result['user']).to include('companies')
    user_company_info_of_first = result['user']['companies'].first

    expect(user_company_info_of_first).to include('id')
    expect(user_company_info_of_first).to include('display_name')
    expect(user_company_info_of_first).to include('role')
  end
end
