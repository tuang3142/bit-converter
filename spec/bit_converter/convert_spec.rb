# frozen_string_literal: true

RSpec.describe BitConverter::Convert do
  describe ".convert" do
    context "currencies are not available"

    it "converts coin to coin" do
      setup_exchange_rates({ "BTC" => 1.0/45_678.90, "USDT" => 1.0 })

      expect(described_class.convert(amount: 10, from: "BTC", to: "USDT"))
        .to be_within(0.001).of 456_789
      expect(described_class.convert(amount: 45_678.0, from: "USDT", to: "BTC"))
        .to be_within(0.001).of 1
    end

    it "converts coin to fiat and vice versa" do
      setup_coin_price("BTC", "USD", 45_678.91)

      expect(described_class.convert(amount: 10, from: "BTC", to: "USD"))
        .to be_within(0.001).of 456_789.1

      expect(described_class.convert(amount: 45_678.91, from: "USD", to: "BTC"))
        .to be_within(0.001).of 1
    end

    it "converts fiat to fiat" do
      setup_coin_price("USDT", "USD", 1)
      setup_coin_price("USDT", "VND", 23_456.7)

      expect(described_class.convert(amount: 100, from: "USD", to: "VND"))
        .to be_within(0.001).of 2_345_670

      expect(described_class.convert(amount: 234_567, from: "VND", to: "USD"))
        .to be_within(0.001).of 10
    end

    def setup_exchange_rates(rates)
      allow(BitConverter::CoinbaseWrapper)
        .to receive(:usdt_exchange_rates)
        .and_return(rates)
    end

    def setup_coin_price(from_coin, to_fiat, price)
      allow(BitConverter::CoinbaseWrapper)
        .to receive(:coin_prices)
        .with(from_coin, to_fiat)
        .and_return(price)
    end
  end
end

