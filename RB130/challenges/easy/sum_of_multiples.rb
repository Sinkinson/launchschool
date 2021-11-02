# Write a program that, given a natural number and a set of one or more other numbers, can find the sum of
# all the multiples of the numbers in the set that are less than the first number. If the set of numbers
# is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either
# 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(number)
    result = []
    multiples.each do |multiple|
      accumulator = multiple
      while accumulator < number
        result << accumulator
        accumulator += multiple
      end
    end
    result.uniq.sum
  end

  def self.to(number)
    SumOfMultiples.new(3, 5).to(number)
  end
end

# option 2
class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end
