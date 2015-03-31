require 'spec_helper'

describe Freee::Tag do

  let(:company_id) { -1 }
  let(:params) { fixture('create_tag.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Tag
  end
  describe 'tag' do
    context '#list' do
      before do
        stub_get('/api/1/tags?company_id=-1').to_return(body: fixture('tags.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      describe 'should can be able to create instance' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Tag) }
      end

      describe 'should get tags of first item for the company' do
        subject { @responses['tags'].first }

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
        stub_post('/api/1/tags').
          with(body: json).
          to_return(body: fixture('tag.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      describe 'should can be able to create instance' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Tag) }
      end

      describe 'should get tags of first item for the company' do
        subject { @responses['tag'] }

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
