# frozen_string_literal: true

module BitConverter
  class ExchangeRate
    class << self
      def rate(from, to)
        from_type = CurrencyType.type(from)
        to_type = CurrencyType.type(to)

        send(:"#{from_type}_to_#{to_type}", from, to)
      end

      private

      def coin_to_coin(from, to)
        rate_of(to) / rate_of(from)
      end

      def coin_to_fiat(from, to)
        CoinbaseWrapper.coin_prices(from, to)
      end

      def fiat_to_coin(from, to)
        1 / coin_to_fiat(to, from)
      end

      def fiat_to_fiat(from, to)
        fiat_to_coin(from, "USDT") / fiat_to_coin(to, "USDT")
      end

      private

      def rate_of(coin)
        rates[coin].to_f
      end

      def rates
        @rates ||= CoinbaseWrapper.usdt_exchange_rates
      end
    end
  end
end
