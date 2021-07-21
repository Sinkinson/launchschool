# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p
# we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.

def dig_pow(n, power)
  numbers = nums_raised_to_powers(n, power)
  multiplier = 1

  total = numbers.sum
  total % n == 0 ? (total / n) : -1
end

def nums_raised_to_powers(n, power)
  n.to_s.chars.map(&:to_i).each_with_object([]) do |num, obj|
    obj << num ** power
    power += 1
  end
end

p dig_pow(89, 1)
p dig_pow(92, 1)
p dig_pow(46288, 3)
