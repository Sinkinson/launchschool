# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument
# the first Fibonacci number has index 1

def find_fibonacci_index_by_length(integer)
  fib_array = [0, 1]
  loop do
    break if fib_array.last.to_s.size >= integer
    next_fib = fib_array[-2] + fib_array[-1]
    fib_array << next_fib
  end
  wanted_fib = fib_array[-1]
  wanted_index = fib_array.index(wanted_fib)
end

# test cases
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# LS way

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

# index started at 2 since we now have the 2nd fibonacci number in second
