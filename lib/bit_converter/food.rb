# frozen_string_literal: true

require "active_support/inflector"

module BitConverter
  class Food
    def self.portray(food)
      if food == "Broccoli"
        "Gross!"
      else
        "Delicious!"
      end
    end

    def self.pluralize(food)
      food.pluralize
    end
  end
end
