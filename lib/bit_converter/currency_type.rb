# frozen_string_literal: true

require "money"

module BitConverter
  class CurrencyType
    def self.type(currency)
      new(currency).type
    end

    def initialize(currency)
      @currency = Money::Currency.find(currency)
    end

    def type
      # subject to change in future version of "money"
      # check here if bugs arise
      return "coin" if @currency.nil? || @currency.id == :btc

      "fiat"
    end
  end
end
