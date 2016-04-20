# spike-ruby ![build status](https://circleci.com/gh/spice-life/spike-ruby.png?style=shield&circle-token=793417d2dc17daaef4dfba6afb6552e4ca4c1023) [![Code Climate](https://codeclimate.com/github/matsubo/spike-ruby/badges/gpa.svg)](https://codeclimate.com/github/matsubo/spike-ruby) [![Test Coverage](https://codeclimate.com/github/matsubo/spike-ruby/badges/coverage.svg)](https://codeclimate.com/github/matsubo/spike-ruby/coverage) [![Issue Count](https://codeclimate.com/github/matsubo/spike-ruby/badges/issue_count.svg)](https://codeclimate.com/github/matsubo/spike-ruby)

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
