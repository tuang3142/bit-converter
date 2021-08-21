# frozen_string_literal: true

require "httparty"
module BitConverter
  class CoinbaseWrapper
    class << self
      def coin_prices(coin, fiat)
        pair = "#{coin.upcase}-#{fiat.upcase}"
        url = "https://api.coinbase.com/v2/prices/#{pair}/spot"
        data = get_request(url)

        data["amount"].to_f
      end

      def usdt_exchange_rates
        exchange_rates("USDT")
      end

      private

      def exchange_rates(coin)
        url = "https://api.coinbase.com/v2/exchange-rates"
        params = { currency: coin }
        data = get_request(url, params)

        data["rates"]
      end

      def get_request(url, params = {})
        response = HTTParty.get(url, { query: params })

        JSON.parse(response.body)["data"]
      end
    end
  end
end
