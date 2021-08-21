# frozen_string_literal: true

require "httparty"
module BitConverter
  class CoinbaseWrapper
    class << self
      def usd_exchange_rates
        get_exchange_rates("USD")
      end

      private

      def get_exchange_rates(coin)
        url = "https://api.coinbase.com/v2/exchange-rates?currency=#{coin}"
        response = HTTParty.get(url)

        JSON.parse(response.body)["data"]["rates"]
      end

    end
  end
end
