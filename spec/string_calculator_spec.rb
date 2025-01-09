require "string_calculator"

RSpec.describe StringCalculator do
	describe '#hello_world' do
		it 'returns the string "Hello, World!"' do
			expect(StringCalculator.hello_world).to eq("Hello, World!")
		end
	end
end