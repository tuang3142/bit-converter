# frozen_string_literal: true

require "net/http"
require "json"

module BitConverter
  class CoinbaseWrapper
    class << self
      def usd_exchange_rates
        get_exchange_rates("USD")
      end

      private

      def get_exchange_rates(coin)
        uri = URI("https://api.coinbase.com/v2/exchange-rates?currency=#{coin}")
        response = Net::HTTP.get(uri)

        JSON.parse(response)["data"]["rates"]
      end

    end
  end
end
