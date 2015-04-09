require 'spec_helper'

describe Freee::User do

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::User
  end

  describe 'user' do
    context '#me' do
      before do
        stub_get('/api/1/users/me').to_return(body: fixture('user.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.me
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/users/me')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('user')
      end

      describe 'should be get information of user' do
        subject { @responses}
        it { is_expected.to be_instance_of(Freee::Response::User) }
      end
    end

    context '#me_all' do
      before do
        stub_get('/api/1/users/me?companies=true').to_return(body: fixture('user_with_companies.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.me_all
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/users/me?companies=true')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('user')
      end

      it 'should be get information of user at all' do
        expect(@responses['user']).to include('companies')
        user_company_info_of_first = @responses['user']['companies'].first

        expect(user_company_info_of_first).to include('id')
        expect(user_company_info_of_first).to include('display_name')
        expect(user_company_info_of_first).to include('role')
      end
    end
  end
end
