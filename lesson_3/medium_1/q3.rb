# someone wrote the following method intending to
# show all the factors of the input number.
# It will fail if the input is zero or negative
# How can you make this work without using begin/end/until?

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# solution: use a while loop

 def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
