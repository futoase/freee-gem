require_relative 'spec_helper'

describe Freee::AccountItem do

  let(:company_id) { -1 }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::AccountItem
  end

  describe '#list' do
    before do
      stub_get('/api/1/account_items?company_id=-1').to_return(body: fixture('account_items.json'), headers: {content_type: 'application/json; charset=utf-8'} )
      @responses = @client.list(company_id)
    end
    after { WebMock.reset! }

    it 'requests the correct resource' do
      assert_request_requested a_get('/api/1/account_items?company_id=-1')
    end

    it 'should can be able to create instance' do
      expect(@responses).to include('account_items')
    end

    describe 'should be get information of account' do
      subject { @responses }
      it { is_expected.to include('account_items') }
      it { is_expected.to be_instance_of(Freee::Response::AccountItem) }
    end

    describe 'should be get information of account_items' do
      subject { @responses['account_items'].first }

      it { is_expected.not_to be_nil }
      it { is_expected.to include('id') }
      it { is_expected.to include('name') }
      it { is_expected.to include('shortcut') }
      it { is_expected.to include('default_tax_id') }
      it { is_expected.to include('categories') }
    end
  end
end
