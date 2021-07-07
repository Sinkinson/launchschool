# Create a function named divisors/Divisors that takes an integer n > 1 and returns 
# an array with all of the integer's divisors(except for 1 and the number itself), 
# from smallest to largest. If the number is prime return the string '(integer) is prime' 

require 'prime'

def divisors(n)
  arr = (2..(n - 1)).to_a
  return "#{n} is prime" if n.prime?
  arr.select { |num| n % num == 0 }
end

# Test cases
p divisors(15)
p divisors(253)
p divisors(24)
p divisors(13)

# Without using prime method

def divisors(n)
  divs = (2..(n - 1)).select { |num| n % num == 0 }
  divs.empty? ? "#{n} is prime" : divs
end
