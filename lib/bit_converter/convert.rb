# frozen_string_literal: true

require "action_view"

module BitConverter
  class Convert
    class << self
      def convert(amount:, from:, to:)
        rate_of(to.upcase) / rate_of(from.upcase) * amount
      end

      def pretty_convert(amount:, from:, to:)
        result = convert(amount: amount, from: from, to: to)

        helper.number_to_currency(result, unit: "")
      end

      private

      def helper
        @helper ||= Class.new do
          include ActionView::Helpers::NumberHelper
        end.new
      end

      def rate_of(currency)
        raise "Currencies #{currency} unavailable" if rates[currency].nil?

        rates[currency].to_f
      end

      def rates
        @rates ||= CoinbaseWrapper.usd_exchange_rates
      end
    end
  end
end
