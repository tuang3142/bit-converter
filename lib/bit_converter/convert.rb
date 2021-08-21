# frozen_string_literal: true

# require_relative "coinbase_wrapper"

module BitConverter
  class Convert
    def self.convert(amount:, from:, to:)
      ExchangeRate.rate(from, to) * amount
    end
  end
end
