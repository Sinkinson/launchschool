# Given a List [] of n integers, find minimum number to be inserted in a list, so that sum of all elements of list should equal the closest prime number.

# List size is at least 2
# List's numbers will only positives (n > 0)
# Repetition of numbers in the list could occur
# The newer list's sum should equal the closest prime number

=begin

problem
- take an array of integers
- find the minimum number to be inserted in a list so that sum of all the elements of the list should equal the closest prime number

input: array of integers
output: integer

example:
({3,1,2}) ==> return (1)
- the sum of the array is 6 and then if we add one we get 7 which is prime

data
- arrays
- integers

algorithm
- sum the given array and assign the total to a variable
- check is that number is prime using a prime method
- if the number is not prime then create a new variable which is the number plus one
- check if this number is prime, if not then add one to this new variable and check again
- keep checking until the number is prime, if the number is prime then take the original summed variable away from this new variable and return the result

=end

# def minimum_number(numbers)
#   total = numbers.sum

#   loop do
#     if prime?(total)
#       return total - numbers.sum
#     else
#       total += 1
#     end
#   end
# end

def minimum_number(numbers)
  total = numbers.sum
  until prime?(total)
    total += 1
  end
  total - numbers.sum
end

def prime?(number)
  (1..number).select { |divisor| number % divisor == 0 } == [1, number]
end

p minimum_number([3,1,2])
p minimum_number([5,2])
p minimum_number([1,1,1])
p minimum_number([2,12,8,4,6])
p minimum_number([50,39,49,6,17,28])

# using the prime method
require 'prime'

def minimum_number(numbers)
  Prime.find { |prime| prime >= numbers.sum } - numbers.sum
end
