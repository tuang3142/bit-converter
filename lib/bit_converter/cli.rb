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
  end
end
