# frozen_string_literal: true

module BitConverter
  class Convert
    class << self
      def convert(amount:, from:, to:)
        rate_of(to.upcase) / rate_of(from.upcase) * amount
      end

      private

      def rate_of(currency)
        raise "Currencies #{currency} unavailable" if rates[currency].nil?

        rates[currency].to_f
      end

      def rates
        CoinbaseWrapper.usd_exchange_rates
      end
    end
  end
end
