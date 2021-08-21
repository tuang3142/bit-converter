require "thor"
require "bit_converter"

module BitConverter
  class CLI < Thor
    desc "portray ITEM", "Determines if a piece of food is gross or delicious"
    def portray(name)
      puts BitConverter::Food.portray(name)
    end

    desc "pluralize", "Pluralizes a word"
    method_option :word, :aliases => :word
    def pluralize
      puts BitConverter::Food.pluralize(options[:word])
    end

    desc "convert AMOUNT FROM TO", "Converts between fiat and cypto currencies"
    def convert(amount, from, to)
      puts BitConverter::Convert.convert(amount: amount.to_f,
                                         from: from,
                                         to: to)
    end
  end
end
