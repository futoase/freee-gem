require 'spec_helper'

describe Freee::Item do

  let(:company_id) { -1 }
  let(:params) { fixture('create_deal.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Item
  end

  describe 'item' do
    context '#list' do
      before do
        stub_get('/api/1/items?company_id=-1').to_return(body: fixture('items.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/items?company_id=-1')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('items')
      end

      describe 'should can be able to create instance' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Item) }
      end

      describe 'should get information of first item for the company' do
        subject { @responses['items'].first }

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
        stub_post('/api/1/items').
          with(body: json).
          to_return(body: fixture('item.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('/api/1/items').with(body: json)
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('item')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.to be_instance_of(Freee::Response::Item) }
      end

      describe 'should get information of first item for the company' do
        subject { @responses['item'] }

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
