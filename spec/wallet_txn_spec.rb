require 'spec_helper'

describe Freee::WalletTxn do

  let(:company_id) { -1 }
  let(:params) { fixture('create_wallet_txn.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::WalletTxn
  end

  describe 'wallet_txn' do
    context '#list' do
      before do
        stub_get('/api/1/wallet_txns?company_id=-1').to_return(body: fixture('wallet_txns.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::WalletTxn) }
      end

      describe 'should get information of wallet txns for the company' do
        subject { @responses }
        
        it { is_expected.to include('wallet_txns') }
      end

      describe 'should get information of first wallet txns for the company' do
        subject { @responses['wallet_txns'].first }

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
    end

    context '#create' do
      before do
        stub_post('/api/1/wallet_txns').
          with(body: json).
          to_return(body: fixture('wallet_txn.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('/api/1/wallet_txns').with(body: json)
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('wallet_txn')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::WalletTxn) }
      end

      describe "should set information of one's wallet txns" do
        subject { @responses['wallet_txn'] }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('company_id') }
        it { is_expected.to include('walletable_id') }
        it { is_expected.to include('date') }
        it { is_expected.to include('walletable_type') }
        it { is_expected.to include('amount') }
        it { is_expected.to include('entry_side') }
      end
    end
  end
end
