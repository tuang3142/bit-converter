# frozen_string_literal: true

RSpec.describe BitConverter::CurrencyType do
  describe ".type" do
    it "returns 'fiat' if a currency is fiat" do
      %w[EUR USD JPY].each do |fiat|
        expect(described_class.type(fiat)).to eq "fiat"
      end
    end

    it "returns 'coin' if a currency is crypto" do
      %w[BTC ETH].each do |coin|
        expect(described_class.type(coin)).to eq "coin"
      end
    end

    it "returns nil if a currency is not available"
  end
end

