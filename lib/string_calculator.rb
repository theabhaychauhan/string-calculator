class StringCalculator
  class << self
    def add(numbers_string)
      numbers = StringParser.parse(numbers_string)
      numbers.sum
    end
  end

	private

  class StringParser
    def self.parse(numbers_string)
      return [] if numbers_string.empty?

      numbers_string.split(/[\n,]/).map(&:to_i)
    end
  end  
end
