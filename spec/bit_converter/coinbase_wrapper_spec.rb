# frozen_string_literal: true

RSpec.describe BitConverter::CoinbaseWrapper do
  describe ".coin_prices", :stub_coinbase_request do
    it "returns market price of a crypto-fiat pair" do
      expect(described_class.coin_prices("BTC", "USD"))
        .to eq 45_678.9

      expect(described_class.coin_prices("ETH", "USD"))
        .to eq 3_456.7

      expect(described_class.coin_prices("USDT", "USD"))
        .to eq 1.0
    end
  end
end
