class CalculationService
  class << self
    def add(a, b)
      proc = Proc.new { |a, b| a + b }
      proc.call(a, b)
    end

    # CalculationService.run(2, 3) { |a, b| a * b } # => 6
    def run(a, b, &block)
      block.call(a, b)
    end

    # CalculationService.div(10, 2) { |a, b| a / b } # => 5
    def div(a, b)
      yield(a, b)
    end
  end
end
