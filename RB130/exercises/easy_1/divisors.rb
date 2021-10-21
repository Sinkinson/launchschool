# Write a method that returns a list of all of the divisors of the positive integer passed in
# as an argument. The return value can be in any sequence you wish.

def divisors(number)
  range = (1..number).to_a
  range.select { |div| number % div == 0 }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# LS way
def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end

# Faster way without brute force
def divisors(num)
  result = []
  one_to_sqrt = (1..Math.sqrt(num)).to_a
  one_to_sqrt.each do |div|
    if num % div == 0
      result << div
      result << (num / div)
    end
  end
  result.uniq.sort
end
