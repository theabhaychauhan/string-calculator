# frozen_string_literal: true

require 'byebug'

# frozen_string_literal: true

# The StringCalculator class provides a method for adding numbers from a
# string input.
class StringCalculator
  class << self
    def add(numbers_string)
      numbers = StringParser.parse(numbers_string)

      check_negative_numbers!(numbers)

      numbers.sum
    end

    private

    def check_negative_numbers!(numbers)
      negative_numbers = numbers.select(&:negative?)
      return if negative_numbers.empty?

      raise ArgumentError, "Negative numbers not allowed. Negative numbers present -> #{negative_numbers.join(', ')}"
    end
  end

  DEFAULT_DELIMITER = ','

  # The StringParser class is responsible for parsing a string of numbers
  # and converting them into an array of integers.
  class StringParser
    def self.parse(numbers_string)
      return [] if numbers_string.empty?

      delimiter = DEFAULT_DELIMITER
      if numbers_string.start_with?('//')
        delimiter, numbers_string = extract_special_delimiter(numbers_string)
      else
        DEFAULT_DELIMITER
      end

      numbers_string.split(/[\n#{delimiter}]/).map(&:to_i)
    end

    def self.extract_special_delimiter(numbers_string)
      delimiter_part, numbers_string = numbers_string.split("\n")
      delimiter = delimiter_part[2..]

      [delimiter, numbers_string]
    end
  end
end
