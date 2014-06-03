require 'spec_helper'

describe Freee::Util do
  let(:client_id) { get_client_id }
  let(:secret_key) { get_secret_key }
  let(:redirect_url) { get_redirect_url }
  let(:authorization_code) { get_authorization_code }
  let(:token) { get_token }

  it 'should be get access token' do
    result = Freee::Util.create_token(
      client_id: client_id,
      secret_key: secret_key,
      redirect_url: redirect_url,
      authorization_code: authorization_code
    )
    expect(result).to be_kind_of(String)
    expect(result).to match(/[a-z0-9]{64}/)
  end
end
