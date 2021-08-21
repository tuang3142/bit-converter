# BitConverter

A simple crypto and fiat currency converter which can also serve as a minimal portfolio tracker. Exchange rate data are from [CoinBase](https://developers.coinbase.com/api/v2).

## Installation

```ruby
gem 'bit_converter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bit_converter

## Usage

```
❯ bit -h
Commands:
  bit convert AMOUNT FROM TO  # Converts between fiat and crypto currencies

❯ bit convert 1 btc usd
48,840.005

❯ bit convert 3142 doge btc
0.020981663970713434
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tuang3142/bit-converter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
