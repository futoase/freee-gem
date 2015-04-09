require 'spec_helper'

describe Freee::Section do

  let(:company_id) { -1 }
  let(:params) { fixture('create_section.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Section
  end
  describe 'section' do
    context '#list' do
      before do
        stub_get('/api/1/sections?company_id=-1').to_return(body: fixture('sections.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      describe 'should can be able to create instance' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Section) }
      end

      describe 'should get sections of first item for the company' do
        subject { @responses['sections'].first }

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
        stub_post('/api/1/sections').
          with(body: json).
          to_return(body: fixture('section.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      describe 'should can be able to create instance' do
        subject { @responses }

        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Section) }
      end

      describe 'should get sections of first item for the company' do
        subject { @responses['section'] }

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
