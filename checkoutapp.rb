require 'sinatra'
require 'haml'

set :views, settings.root + '/checkoutapp'

get '/' do
  raise('missing SPIKE_PUBLIC_KEY env') if ENV['SPIKE_PUBLIC_KEY'].nil? || ENV['SPIKE_PUBLIC_KEY'].empty?
  @public_key = ENV['SPIKE_PUBLIC_KEY']
  haml :index
end
