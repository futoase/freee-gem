require 'spec_helper'

describe Freee::Company do

  let(:company_id) { -1 }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Company
  end

  describe 'company' do
    context '#list' do
      before do
        stub_get('/api/1/companies').to_return(body: fixture('companies.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/companies')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('companies')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Company) }
      end
    end

    context '#show' do
      before do
        stub_get('/api/1/companies/-1').to_return(body: fixture('company.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.show(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/companies/-1')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('company')
      end

      describe 'should be get information of item for the company'  do
        subject { @responses['company'] }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('name') }
        it { is_expected.to include('name_kana') }
        it { is_expected.to include('display_name') }
        it { is_expected.to include('role') }
      end
    end
  end
end
