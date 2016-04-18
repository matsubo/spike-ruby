require 'spec_helper'

describe Spike::Token do

  let(:secret_api_key) { 'sk_test_IFWHL5kDDZFV72KtPyBp0leO' }

  describe 'create new token ' do
    let(:token) { 'tok_rNUiMLP32pYQkpe2PqYAUuHK' }
    let(:request_params) do
      {
        'card[number]' => '4444333322221111',
        'card[exp_month]' => '3',
        'card[exp_year]' => '2017',
        'card[cvc]' => '111',
        'card[name]' => 'TARO SPIKE',
        'currency' => 'JPY',
        'email' => 'foo@example.com',
      }
    end

    subject do
      res = nil
      VCR.use_cassette 'lib/spike_create_token' do
        res = Spike.new(secret_api_key).token.create(request_params)
      end
      res
    end

    it { expect(subject.id).not_to eq nil }
    it { expect(subject.object).to eq 'token' }
    it { expect(subject).to_not be_live_mode }
    it { expect(subject.created.class).to eq Time }
    it { expect(subject.type).to eq 'card' }
    it { expect(subject.currency).to eq 'JPY' }
    it { expect(subject.source.class).to eq Hash }
  end

  describe 'get token' do
    subject do
      res = nil
      VCR.use_cassette 'lib/spike_get_token' do
        res = Spike.new(secret_api_key).token.retrieve("tok_PG2Kltpdi9FlEsvJwaPILRxT")
      end
    end

    it { expect(subject.object).to eq 'token' }
    it { expect(subject).to_not be_live_mode }
    it { expect(subject.type).to eq 'card' }
    it { expect(subject.currency).to eq 'JPY' }
  end
end
