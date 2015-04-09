require 'spec_helper'

describe Freee::Base do
  let(:freee) { Freee::Base.new }

  before(:each) do
    Freee::Base.set_env
  end

  it 'should be able to get client' do
    expect(freee.client).not_to be_nil
  end
end
