# Create a method that takes two integers as arguments. The first is a count, and the second
# is the first number of a sequence that your method will create. The method should return an
# array that contains the same number of elements as the count argument, while the values
# of each element will be multiples of the starting number.
# You may assume that the count arument will always have a value of 0 or greater, while the
# starting number can be any integer value. If the count is 0 and empty list should be returned.

def sequence(count, number)
  array = []
  count.times do |int|
    array << number * (int + 1)
  end
  array
end

# test cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# instead of multiplying the number this simply adds the number each time to get multiples

def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

# using the map method

def sequence(count, first)
  (1..count).map { |value| value * first }
end

# You don't need to convert a range to an array before, map treats it as one anyway
# so in the above map is iterating over [1,2,3,4,5]
# it then multiplies each value by the given integer to get the multiple
