require 'spec_helper'

describe Freee::Deal do

  let(:company_id) { -1 }
  let(:params) { fixture('create_deal.json') }
  let(:json) { { params: params } }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Deal
  end

  describe 'deal' do
    context '#list' do
      before do
        stub_get('/api/1/deals?company_id=-1').to_return(body: fixture('deals.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/deals?company_id=-1')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('deals')
      end

      describe 'should get deal of first for the company' do
        subject { @responses['deals'].first }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('company_id') }
        it { is_expected.to include('issue_date') }
        it { is_expected.to include('due_date') }
        it { is_expected.to include('amount') }
        it { is_expected.to include('due_amount') }
        it { is_expected.to include('type') }
        it { is_expected.to include('partner_id') }
        it { is_expected.to include('details') }
        it { is_expected.to include('payments') }
      end

      describe 'should get details from deals for the company' do
        subject { @responses['deals'].first['details'].first }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('account_item_id') }
        it { is_expected.to include('tax_id') }
        it { is_expected.to include('item_id') }
        it { is_expected.to include('amount') }
        it { is_expected.to include('description') }
      end

      describe 'should get payments from deals for the company' do
        subject { @responses['deals'].first['payments'].first }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('date') }
        it { is_expected.to include('from_walletable_type') }
        it { is_expected.to include('from_walletable_id') }
        it { is_expected.to include('amount') }
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.to be_instance_of(Freee::Response::Deal) }
      end
    end

    context '#list_income' do
      before do
        stub_get('/api/1/deals?company_id=-1&type=income').to_return(body: fixture('deals.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list_income(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/deals?company_id=-1&type=income')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('deals')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.to be_instance_of(Freee::Response::Deal) }
      end
    end

    context '#list_expense' do
      before do
        stub_get('/api/1/deals?company_id=-1&type=expense').to_return(body: fixture('deals.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.list_expense(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/deals?company_id=-1&type=expense')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('deals')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.to be_instance_of(Freee::Response::Deal) }
      end
    end

    context '#create' do
      before do
        stub_post('/api/1/deals').
          with(body: json).
          to_return(body: fixture('deal.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.create(params)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_post('/api/1/deals').with(body: json)
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('deal')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.to be_instance_of(Freee::Response::Deal) }
      end

      describe 'should get deal of first for the company' do
        subject { @responses['deal'] }

        it { is_expected.not_to be_nil }
        it { is_expected.to include('id') }
        it { is_expected.to include('company_id') }
        it { is_expected.to include('issue_date') }
        it { is_expected.to include('due_date') }
        it { is_expected.to include('amount') }
        it { is_expected.to include('due_amount') }
        it { is_expected.to include('type') }
        it { is_expected.to include('partner_id') }
        it { is_expected.to include('details') }
        it { is_expected.to include('payments') }
      end

      describe 'should get details from deals for the company' do
        subject { @responses['deal']['details'].first}

        it { is_expected.not_to be_nil }
        it { is_expected.to include('account_item_id') }
        it { is_expected.to include('tax_id') }
        it { is_expected.to include('item_id') }
        it { is_expected.to include('amount') }
        it { is_expected.to include('description') }
      end
    end
  end
end
