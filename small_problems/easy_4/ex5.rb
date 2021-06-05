# write a method that searches for all multiples of 3 or 5 that lie between
# 1 and some other number, and then computes the sum of those multiples
# so if supplied number was 20, result should be 98
# can assume integer passed is greater than 1

def multisum(num)
  arr = (1..num).to_a
  threes_fives = arr.select do |n|
    n % 3 == 0 || n % 5 == 0
  end
  threes_fives.inject(:+)
end

# test cases
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# could make the above method slightly more succinct

# def multisum(num)
#   (1..num).to_a.select { |n| \
#     n % 3 == 0 || n % 5 == 0 }.inject(:+)
# end

# LS way

# def multiple?(number, divisor)
#   number % divisor == 0
# end

# def multisum(max_value)
#   sum = 0
#   1.upto(max_value) do |number|
#     if multiple?(number, 3) || multiple?(number, 5)
#       sum += number
#     end
#   end
#   sum
# end
