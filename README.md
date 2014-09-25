# spike-ruby ![build status](https://circleci.com/gh/spice-life/spike-ruby.png?style=shield&circle-token=793417d2dc17daaef4dfba6afb6552e4ca4c1023)

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

## Get credit card token

```shell
$ gem install sinatra
$ SPIKE_PUBLIC_KEY=pk_xxxxxxx ruby checkoutapp.rb
```

Access to http://localhost:4567

## Contributing

1. Fork it ( https://github.com/spice-life/spike-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
