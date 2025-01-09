require "string_calculator"

RSpec.describe StringCalculator do
	describe '#add' do
		context "When empty string is passed" do
			before :all do
				@string_sum = StringCalculator.add("")
			end

			it "Does something" do
				expect(@string_sum).to eq(0)
			end
		end
	end
end