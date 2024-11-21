require_relative '../lib/random_float'

RSpec.describe RandomFloat do
  describe ".generate" do
    context "when min < max" do
      it "генерує випадкове число в межах діапазону" do
        result = RandomFloat.generate(1.5, 5.5)
        expect(result).to be >= 1.5
        expect(result).to be <= 5.5
      end

      it "генерує випадкове число в межах іншого діапазону" do
        result = RandomFloat.generate(0.0, 1.0)
        expect(result).to be >= 0.0
        expect(result).to be <= 1.0
      end

      it "генерує випадкове число, коли min і max дуже близькі" do
        result = RandomFloat.generate(0.0, Float::EPSILON)
        expect(result).to be >= 0.0
        expect(result).to be <= Float::EPSILON
      end
    end

    context "when min >= max" do
      it "викидає помилку ArgumentError" do
        expect { RandomFloat.generate(5, 1) }.to raise_error(ArgumentError, "Min must be less than Max")
      end
    end

    context "when invalid types are provided" do
      it "викидає помилку ArgumentError для некоректних типів" do
        expect { RandomFloat.generate("a", "b") }.to raise_error(ArgumentError)
        expect { RandomFloat.generate(nil, 1.0) }.to raise_error(ArgumentError)
        expect { RandomFloat.generate(0.0, nil) }.to raise_error(ArgumentError)
      end
    end
  end
end
