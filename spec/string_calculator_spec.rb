# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'When empty string is passed' do
      let(:string_sum) { StringCalculator.add('') }

      it 'Returns 0' do
        expect(string_sum).to eq(0)
      end
    end

    context 'When single digit string is passed' do
      let(:string_sum) { StringCalculator.add('10') }

      it 'Returns 10' do
        expect(string_sum).to eq(10)
      end
    end

    context 'When multiple numbers are passed' do
      let(:string_sum) { StringCalculator.add('1,2') }

      it 'Returns 3' do
        expect(string_sum).to eq(3)
      end
    end

    context 'When unknown amount of numbers are passed' do
      let(:numbers_string) { '1,2,3,4,5,6,7,8,9,10' }
      let(:string_sum) { StringCalculator.add(numbers_string) }

      it 'Returns the sum of all numbers' do
        expected_sum = numbers_string.split(',').map(&:to_i).sum
        expect(string_sum).to eq(expected_sum)
      end
    end

    context 'When newlines are used between numbers' do
      let(:string_sum) { StringCalculator.add("1\n2,3") }

      it 'Returns 6' do
        expect(string_sum).to eq(6)
      end
    end

    context 'When custom delimiter is used' do
      let(:string_sum) { StringCalculator.add("//;\n1;2") }

      it 'Returns the sum - 3 using the special delimiter' do
        expect(string_sum).to eq(3)
      end
    end

    context 'When custom delimiter with multiple numbers is used' do
      let(:string_sum) { StringCalculator.add("//|\n1|2|3|4|5") }

      it 'Returns the sum - 15 using the special delimiter' do
        expect(string_sum).to eq(15)
      end
    end

    context 'When custom delimiter contains special characters' do
      let(:string_sum) { StringCalculator.add("//.*\n1.*2.*3") }

      it 'Returns the sum - 6 using the special delimiter with special characters' do
        expect(string_sum).to eq(6)
      end
    end
  end
end
