require 'spec_helper'

describe Spike::Charge do
  let(:secret_api_key) { 'sk_test_IFWHL5kDDZFV72KtPyBp0leO' }

  describe 'create new charge' do
    let(:token) { 'tok_bUEcGsUHKT84WwCp4clFrLYv' }
    let(:products) do
      [
        {
          title: '商品',
          description: '商品説明',
          language: 'ja',
          price: 900,
          currency: 'JPY',
          count: 1,
          id: '00001',
          stock: 10
        }
      ]
    end
    let(:request_params) { { amount: 900, currency: 'JPY', card: token } }

    subject do
      res = nil
      VCR.use_cassette 'lib/spike_create_charge' do
        res = Spike.new(secret_api_key).charge.create(request_params, products)
      end
      res
    end

    it { expect(subject.id).not_to eq nil }
    it { expect(subject.object).to eq 'charge' }
    it { expect(subject).to_not be_live_mode }
    it { expect(subject).to be_paid }
    it { expect(subject).to be_captured }
    it { expect(subject.amount).to eq 900.0 }
    it { expect(subject.currency).to eq 'JPY' }
    it { expect(subject).to_not be_refunded }
    it { expect(subject.amount_refunded).to be_nil }
    it { expect(subject.refunds).to be_empty }
  end

  describe 'get charge' do
    subject do
      res = nil
      VCR.use_cassette 'lib/spike_get_charge' do
        res = Spike.new(secret_api_key).charge.retrieve('20160418-100308-ywci76')
      end
    end

    it { expect(subject.object).to eq 'charge' }
    it { expect(subject).to_not be_live_mode }
    it { expect(subject).to be_paid }
    it { expect(subject).to be_captured }
    it { expect(subject.amount).to eq 900.0 }
    it { expect(subject.currency).to eq 'JPY' }
    it { expect(subject).to_not be_refunded }
    it { expect(subject.amount_refunded).to be_nil }
    it { expect(subject.refunds).to be_empty }
  end

  describe 'get charges' do
    subject do
      res = nil
      VCR.use_cassette 'lib/spike_list_charges' do
        res = Spike.new(secret_api_key).charge.list
      end
    end

    it { expect(subject.object).to eq 'list' }
    it { expect(subject.data.class).to be Array }
  end
end
