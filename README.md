# spike-ruby

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

### Create charge

```ruby
  require 'spike'

  spike = Spike.new(spike_secret_apie_key)

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

  spike.charge.create(request_parmas, products)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/spike-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
