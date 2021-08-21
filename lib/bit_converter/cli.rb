# frozen_string_literal: true

require "thor"
require "money"
require "bit_converter"

module BitConverter
  class CLI < Thor
    desc "ping", "pong!"
    def ping
      puts BitConverter::Ping.ping
    end

    desc "convert AMOUNT FROM TO", "Converts between fiat and cypto currencies"
    def convert(amount, from, to)
      puts BitConverter::Convert.convert(amount: amount.to_f,
                                         from: from,
                                         to: to)
    rescue RuntimeError => e
      puts e.message
    end
  end
end
