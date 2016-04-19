require 'spec_helper'

describe Spike do

  let(:secret_api_key) { 'sk_test_IFWHL5kDDZFV72KtPyBp0leO' }

  describe 'to raise Spike::NotFoundError' do

    subject do
      VCR.use_cassette 'lib/not_found' do
        Spike.new(secret_api_key).get(request_path: 'not_found_path')
      end
    end

    it { expect { subject }.to raise_error Spike::NotFoundError }
  end


  describe 'to raise Spike::UnauthorizedError' do
  let(:secret_api_key) { 'invalid_secret_key' }

    subject do
      VCR.use_cassette 'lib/unauthorized_error' do
        Spike.new(secret_api_key).get(request_path: '/charges')
      end
    end

    it { expect { subject }.to raise_error Spike::UnauthorizedError}
  end


end
