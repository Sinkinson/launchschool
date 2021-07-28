# Write a method that computes the difference between the square of the sum of the first n positive integers
# and the sum of the squares of the first n positive integers.

def sum_square_difference(num)
  base_array = (1..num).to_a
  sum_square = base_array.sum ** 2
  square_sum = base_array.map { |n| n ** 2 }.sum
  sum_square - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# LS way
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end
