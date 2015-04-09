require 'spec_helper'

describe Freee::Util do

  let(:authorization_code) { 'authorization_code' }
  let(:redirect_uri) { get_redirect_url }
  let(:access_token) { OpenStruct.new({token: 'a'*64 }) }

  before do
    stub_post("/oauth/token").
      with(:body => "{\"grant_type\":\"authorization_code\",\"code\":\"#{authorization_code}\",\"redirect_uri\":#{redirect_uri}}").
      to_return(:status => 200, :body => "", :headers => {})
    allow_any_instance_of(OAuth2::Client).to receive(:get_token).
      and_return(access_token)
  end

  it 'should be get access token' do
    result = Freee::Util.create_token(
      client_id: get_client_id,
      secret_key: get_secret_key,
      redirect_url: redirect_uri,
      authorization_code: authorization_code
    )

    token = result[:token]
    expect(token).to be_kind_of(String)
    expect(token).to match(/[a-z0-9]{64}/)
  end
end
