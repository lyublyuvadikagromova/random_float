class RandomFloat
  def self.generate(min = 0.0, max = 1.0)
    unless min.is_a?(Numeric) && max.is_a?(Numeric)
      raise ArgumentError, "Min and Max must be numbers"
    end
    raise ArgumentError, "Min must be less than Max" if min >= max
    rand * (max - min) + min
  end
end
