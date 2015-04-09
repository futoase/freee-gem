require 'spec_helper'

describe Freee::Partner do

  let(:company_id) { -1 }
  let(:params) { fixture('create_partner.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Partner
  end
  describe 'partner' do
    context '#list' do
      before do
        stub_get('/api/1/partners?company_id=-1').to_return(body: fixture('partners.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      describe 'should can be able to create instance' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Partner) }
      end

      describe 'should get partners of first item for the company' do
        subject { @responses['partners'].first }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('company_id') }
        it { is_expected.to include('name') }
        it { is_expected.to include('shortcut1') }
        it { is_expected.to include('shortcut2') }
      end
    end

    context '#create' do
      before do
        stub_post('/api/1/partners').
          with(body: json).
          to_return(body: fixture('partner.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      describe 'should can be able to create instance' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Partner) }
      end

      describe 'should get partners of first item for the company' do
        subject { @responses['partner'] }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('company_id') }
        it { is_expected.to include('name') }
        it { is_expected.to include('shortcut1') }
        it { is_expected.to include('shortcut2') }
      end
    end
  end
end
