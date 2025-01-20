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
  MAX_ALLOWED_NUMBER = 1000

  # The StringParser class is responsible for parsing a string of numbers
  # and converting them into an array of integers.
  class StringParser
    def self.parse(numbers_string)
      return [] if numbers_string.empty?

      delimiter = DEFAULT_DELIMITER
      numbers_string = handle_single_astrisk(numbers_string)
      if numbers_string.start_with?('//')
        delimiter, numbers_string = extract_special_delimiter(numbers_string)
      else
        DEFAULT_DELIMITER
      end
      numbers = numbers_string.split(/[\n#{delimiter}]/).map(&:to_i)
      numbers.select { |number| number <= MAX_ALLOWED_NUMBER }
    end

    def self.extract_special_delimiter(numbers_string)
      delimiter_part, numbers_string = numbers_string.split("\n")
      delimiter = delimiter_part[2..]

      [delimiter, numbers_string]
    end

    def self.handle_single_astrisk(numbers_string)
      if(numbers_string.include?('*') && !numbers_string.include?('**'))
        chars = numbers_string.chars
        index_of_astrisk = chars.find_index("*")
        if chars[index_of_astrisk - 1].scan(/\D/).empty?
          numbers_string = numbers_string.dup
          numbers_string.gsub!("#{chars[index_of_astrisk - 1]}*#{chars[index_of_astrisk + 1]}", (chars[index_of_astrisk - 1].to_i * chars[index_of_astrisk + 1].to_i).to_s)
        end
      end
      numbers_string
    end
  end
end
