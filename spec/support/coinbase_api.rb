# frozen_string_literal: true

COIN_PRICES = {
  "BTC-USD"  => 45_678.9,
  "ETH-USD"  => 3_456.7,
  "USDT-USD" => 1.0
}.freeze

RSpec.configure do |config|
  config.around(:each, stub_coinbase_request: true) do |example|
    COIN_PRICES.each do |pair, price|
      base, currency = pair.split("-")
      stub_request(:get, "https://api.coinbase.com/v2/prices/#{pair}/spot")
        .to_return(
          body: {
            "data"=>{"base"=>base, "currency"=>currency, "amount"=>price}
          }.to_json,
          status: 200
        )
    end

    example.run
  end
end
