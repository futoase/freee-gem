require 'spec_helper'

describe Freee::Tax do
  let(:company_id) { -1 }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Tax
  end

  describe 'tax' do
    context '#list' do
      before do
        stub_get('/api/1/taxes?company_id=-1').to_return(body: fixture('taxes.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/taxes?company_id=-1')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Tax) }
      end

      describe 'should get item of tax for the company' do
        subject { @responses }

        it { is_expected.to include('taxes') }
      end

      describe 'should get item of first tax for the company' do
        subject { @responses['taxes'].first }

        it { is_expected.to include('id') }
        it { is_expected.to include('name') }
      end
    end

    context '#list_of_code' do
      before do
        stub_get('/api/1/taxes/codes').to_return(body: fixture('taxes_with_code.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list_of_code
      end

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/taxes/codes')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Tax) }
      end

      describe 'should get item of tax for the company' do
        subject { @responses }

        it { is_expected.to include('taxes') }
      end

      describe 'should get item of first tax for the company' do
        subject { @responses['taxes'].first }

        it { is_expected.to include('code') }
        it { is_expected.to include('name') }
        it { is_expected.to include('name_ja') }
      end
    end

  end
end
