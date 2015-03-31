require 'spec_helper'

describe Freee::Walletable do

  let(:company_id) { -1 }
  let(:params) { fixture('create_walletable.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Walletable
  end

  describe 'walletable' do
    context '#list' do
      before do
        stub_get('/api/1/walletables?company_id=-1').to_return(body: fixture('walletables.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/walletables?company_id=-1')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Walletable) }
      end

      describe 'should get information of walletable for the company' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('walletables') }
      end

      describe 'should get information of first walletable for the company' do
        subject { @responses['walletables'].first }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('name') }
        it { is_expected.to include('type') }
      end
    end

    context '#create' do
      before do
        stub_post('/api/1/walletables').
          with(body: json).
          to_return(body: fixture('walletable.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('/api/1/walletables').with(body: json)
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Walletable) }
      end

      describe 'should get information of walletable for the company' do
        subject { @responses }

        it { is_expected.not_to be_nil }
      end

      describe 'should get information of first walletable for the company' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('name') }
        it { is_expected.to include('type') }
      end

    end
  end
end
