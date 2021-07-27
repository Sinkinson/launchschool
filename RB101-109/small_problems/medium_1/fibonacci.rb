# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two
# previous numbers: the 3rd Fibonacci numberis 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on.
# In mathematical terms:
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

def fibonacci(n)
  return n if n < 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
