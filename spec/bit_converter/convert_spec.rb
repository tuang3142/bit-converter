# frozen_string_literal: true

RSpec.describe BitConverter::Convert do
  describe ".convert", :stub_coinbase_request do
    context "currencies are not available"

    it "converts coin to coin" do
      expect(described_class.convert(amount: 10, from: "BTC", to: "USDT"))
        .to be_within(0.001).of 456_789

      expect(described_class.convert(amount: 45_678, from: "USDT", to: "BTC"))
        .to be_within(0.001).of 1
    end

    it "converts coin to fiat and vice versa" do
      expect(described_class.convert(amount: 10, from: "BTC", to: "USD"))
        .to be_within(0.001).of 456_789

      expect(described_class.convert(amount: 45_678.9, from: "USD", to: "BTC"))
        .to be_within(0.001).of 1
    end

    it "converts fiat to fiat" do
      expect(described_class.convert(amount: 100, from: "USD", to: "VND"))
        .to be_within(0.001).of 2_345_670

      expect(described_class.convert(amount: 234_567, from: "VND", to: "USD"))
        .to be_within(0.001).of 10
    end
  end
end

