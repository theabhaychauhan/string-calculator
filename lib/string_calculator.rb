# frozen_string_literal: true

# The StringCalculator class provides a method for adding numbers from a
# string input.
class StringCalculator
  class << self
    def add(numbers_string)
      numbers = StringParser.parse(numbers_string)
      numbers.sum
    end
  end

  # The StringParser class is responsible for parsing a string of numbers
  # and converting them into an array of integers.
  class StringParser
    def self.parse(numbers_string)
      return [] if numbers_string.empty?

      numbers_string.split(/[\n,]/).map(&:to_i)
    end
  end
end
