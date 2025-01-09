require "string_calculator"

RSpec.describe StringCalculator do
  describe '#add' do
    context "When empty string is passed" do
      let(:string_sum) { StringCalculator.add("") }

      it "Returns 0" do
        expect(string_sum).to eq(0)
      end
    end

    context "When single digit string is passed" do
      let(:string_sum) { StringCalculator.add("10") }

      it "Returns 10" do
        expect(string_sum).to eq(10)
      end
    end

    context "When multiple numbers are passed" do
      let(:string_sum) { StringCalculator.add("1,2") }

      it "Returns 3" do
        expect(string_sum).to eq(3)
      end
    end
  end
end
