# frozen_string_literal: true

require "thor"
require "bit_converter"

module BitConverter
  class CLI < Thor
    desc "ping", "pong!"
    def ping
      puts BitConverter::Ping.ping
    end

    desc "convert AMOUNT FROM TO", "Converts between fiat and cypto currencies"
    def convert(amount, from, to)
      puts BitConverter::Convert.pretty_convert(amount: amount.to_f,
                                                from: from,
                                                to: to)
    rescue RuntimeError => e
      puts e.message
    end

    desc "rate FROM TO", "Get exchange rate between fiat and crypto currencies"
    def rate(from, to)
      convert(1, from, to)
    end
  end
end
