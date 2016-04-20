require 'spec_helper'

describe Spike::Charge do
  let(:secret_api_key) { 'sk_test_Lkg0iMrN5x02S7e4WVE5FgTj' }

  describe 'create new charge' do
    let(:token) { 'tok_rNUiMLP32pYQkpe2PqYAUuHK' }
    let(:products) do
      [
        {
          id: '00001',
          title: '商品',
          description: '商品説明',
          language: 'JA',
          price: 900,
          currency: 'JPY',
          count: 1,
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
        res = Spike.new(secret_api_key).charge.retrieve('20141007-113905-mj7atv4rkg')
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
end
