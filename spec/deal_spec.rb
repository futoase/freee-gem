require 'spec_helper'

describe Freee::Deal do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:token) { get_token }
  let(:company_id) { get_company_id }
  let(:deal) { Freee::Deal }

  before(:each) do
    Freee::Base.config(client_id, secret_key, token)
  end

  it 'should can be able to create instance' do
    expect(deal.list(company_id)).not_to be_nil
  end

  describe 'should get deals for the company' do
    subject { deal.list(company_id) }

    it { is_expected.to include('deals') }
  end

  describe 'should get deal of first for the company' do
    subject { deal.list(company_id)['deals'].first }

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
    subject { deal.list(company_id)['deals'].first['details'].first }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('account_item_id') }
    it { is_expected.to include('tax_id') }
    it { is_expected.to include('item_id') }
    it { is_expected.to include('amount') }
    it { is_expected.to include('description') }
  end

  describe 'should get payments from deals for the company' do
    subject { deal.list(company_id)['deals'].first['payments'].first }

    it { is_expected.not_to be_nil }
    it { is_expected.to include('date') }
    it { is_expected.to include('from_walletable_type') }
    it { is_expected.to include('from_walletable_id') }
    it { is_expected.to include('amount') }
  end

  describe 'should get payments from deals for the company with start_due_date' do
    subject do
      result = deal.list(company_id, start_due_date: '2014-06-25')['deals']
      __memoize = result

      result.select! { |x| x['due_date'] >= '2014-06-25' }
      result.map! { |x| x['due_date'] }

      __memoize.map! { |x| x['due_date'] }

      result.length == __memoize.length
    end

    it { is_expected.not_to be_nil }
    it { is_expected.to be_truthy }
  end

  describe 'should get payments from future deals for the company with start_due_date' do
    subject { deal.list(company_id, start_due_date: '2099-12-31')['deals'] }

    it { is_expected.not_to be_nil }
    it { is_expected.to eq [] }
  end
  
  describe 'should get payments for deals with income' do
    subject do
      result = deal.list_income(company_id)['deals'] 
      result.map! { |x| x['type'] == 'income' }
      Set.new(result).length
    end

    it { is_expected.not_to be_nil }
    it { is_expected.to eq 1 }
  end

  describe 'should get payments for deals with outcome' do
    subject do
      result = deal.list_expense(company_id)['deals'] 
      result.map! { |x| x['type'] == 'expense' }
      Set.new(result).length
    end

    it { is_expected.not_to be_nil }
    it { is_expected.to eq 1 }
  end
end
