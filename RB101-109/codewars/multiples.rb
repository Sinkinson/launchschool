# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

def solution(number)
  result = []
  for i in (1...number) do
    result << i if i % 3 == 0 || i % 5 == 0
  end
  result.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

# Option 2
def solution(number)
  (1...number).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+)
end
