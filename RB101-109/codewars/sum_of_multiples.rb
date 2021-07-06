# Your task is to write function findSum. Upto and including n, this function will 
# return the sum of all multiples of 3 and 5.

def findSum(n)
  integer_arr = (1..n).to_a
  multiples = integer_arr.select do |num|
    num % 3 == 0 || num % 5 == 0
  end
  multiples.sum
end

# Test cases
findSum(5) # should return 8 (3 + 5)
findSum(10) # should return 33 (3 + 5 + 6 + 9 + 10)

# refactor

def findSum(n)
  (1..n).to_a.select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end
