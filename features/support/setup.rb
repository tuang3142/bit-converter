require "aruba/cucumber"
require "webmock/cucumber"

USD_RATES = {
  "BTC"  => 1/45_678.9,
  "ETH"  => 1/3_456.7,
  "USDT" => 1,
  "USD"  => 1,
  "VND"  => 23_456.7
}.freeze

Before("@stub_coinbase_request") do
  USD_RATES.each do |coin, rate|
    stub_request(:get, "https://api.coinbase.com/v2/exchange-rates?currency=USD")
      .to_return(
        body: {
          "data" => {
            "currency" => "USD",
            "rates" => USD_RATES
          }
        }.to_json,
        status: 200
      )
  end
end
