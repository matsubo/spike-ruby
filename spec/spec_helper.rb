require 'bundler'
Bundler.require(:default, :development)

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'spike'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.order = 'random'
end
