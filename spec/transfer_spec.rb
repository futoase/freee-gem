require 'spec_helper'

describe Freee::Transfer do

  let(:company_id) { -1 }
  let(:params) { fixture('create_transfer.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Transfer
  end

  describe 'transfers' do
    context '#list' do
      before do
        stub_get('/api/1/transfers?company_id=-1').to_return(body: fixture('transfers.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/transfers?company_id=-1')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('transfers')
      end

      describe 'should be get information of account' do
        subject { @responses }
        it { is_expected.to be_instance_of(Freee::Response::Transfer) }
      end

      describe 'should be get information of first transfers for the company' do
        subject { @responses['transfers'].first }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('company_id') }
        it { is_expected.to include('date') }
        it { is_expected.to include('amount') }
        it { is_expected.to include('from_walletable_id') }
        it { is_expected.to include('from_walletable_type') }
        it { is_expected.to include('to_walletable_type') }
        it { is_expected.to include('to_walletable_id') }
        it { is_expected.to include('description') }

        context "with options" do
          before do
            stub_get('/api/1/transfers?company_id=-1&limit=3').to_return(body: fixture('transfers.json'), headers: {content_type: 'application/json; charset=utf-8'} )
            @responses = @client.list(company_id, limit: 3)['transfers'].length
          end

          it { assert_request_requested a_get('/api/1/transfers?company_id=-1&limit=3') }
          it { expect(@responses).not_to be_nil }
          it { expect(@responses).to eq 3 }
        end
      end
    end

    context '#create' do
      before do
        stub_post('/api/1/transfers').
          with(body: json).
          to_return(body: fixture('transfer.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('/api/1/transfers').with(body: json)
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('transfer')
      end

      describe 'should be get information of account' do
        subject { @responses }
        it { is_expected.to be_instance_of(Freee::Response::Transfer) }
      end

      describe 'should be get information of first transfers for the company' do
        subject { @responses['transfer'] }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('company_id') }
        it { is_expected.to include('date') }
        it { is_expected.to include('amount') }
        it { is_expected.to include('from_walletable_id') }
        it { is_expected.to include('from_walletable_type') }
        it { is_expected.to include('to_walletable_type') }
        it { is_expected.to include('to_walletable_id') }
        it { is_expected.to include('description') }
      end
    end
  end
end
