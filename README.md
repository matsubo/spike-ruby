# spike-ruby [![Gem Version](https://badge.fury.io/rb/spike-ruby.svg)](https://badge.fury.io/rb/spike-ruby) ![build status](https://circleci.com/gh/matsubo/spike-ruby.png?style=shield&circle-token=7f07d86695915d7a1d34ca37491c3825b5eea2c4) 

[SPIKE](https://spike.cc/) API Client for Ruby.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spike-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spike-ruby

## Usage

### Example: Create charge

```ruby
  require 'spike'

  spike = Spike.new(spike_secret_api_key)

  request_params = {
    amount: 1000,
    currency: "JPY",
    card: token_from_checkout
  }
  products = [{
    title: "item title",
    description: "item description",
    price: 1000,
    stock: 10,
    language: "JA",
    count: 1,
    currency: "JPY",
    id: "00001"
  }]

  spike.charge.create(request_params, products)
```

## Contributing

1. Fork it ( https://github.com/spice-life/spike-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Pass tests (`bundle exec rspec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
