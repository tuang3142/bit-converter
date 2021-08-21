Given(/^"([^"]*)" price in USD is "([^"]*)"$/) do |coin, price|
  allow(CoinbaseWrapper)
  .to receive(:usdt_exchange_rates)
  .and_return({
    coin => price,
    "USDT" => 1.0
  })
end
