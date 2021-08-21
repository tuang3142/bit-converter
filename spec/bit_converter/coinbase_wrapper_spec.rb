# frozen_string_literal: true

RSpec.describe BitConverter::CoinbaseWrapper do
  describe ".usd_exchange_rates", :stub_coinbase_request do
    it "returns exchange rates from a cypto to USDT" do
      usd_exchange_rates = described_class.usd_exchange_rates

      expect(usd_exchange_rates["BTC"].to_f)
        .to be_within(0.001).of 1/45_678.9

      expect(usd_exchange_rates["ETH"].to_f)
        .to be_within(0.001).of 1/3_456.7

      expect(usd_exchange_rates["USDT"].to_f)
        .to be_within(0.001).of 1.0
    end
  end
end
