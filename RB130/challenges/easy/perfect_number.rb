# The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), identifying each as
# belonging uniquely to the categories of abundant, perfect, or deficient based on a comparison between the number and the
# sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding
# the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.

# Examples:

# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Write a program that can tell whether a number is perfect, abundant, or deficient.

class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num < 1
    sum_of_divs = (1...num).select { |div| num % div == 0 }.sum
    if num == sum_of_divs then 'perfect'
    elsif num < sum_of_divs then 'abundant'
    else 'deficient'
    end
  end
end

# option 2
class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end

# Here we are unable to make a class method private. There we put the sum_of_factors method within our class method
# and then use the idiom class << self. This lets us operate on the class itself as an object. This allows us to create
# an instance method for our class object and make it private.
