# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing
# integers (in order) between the first and last elements of the argument.

def missing(arr)
  numbers = (arr.first..arr.last).to_a
  numbers - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# option 2
def missing(arr)
  numbers = (arr.first..arr.last).to_a
  numbers.select { |num| !arr.include?(num) }
end

# LS way
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# this method uses each_cons to go through each consecutive 2 number pair
# it then gets the missing numbers between this pair and concatenates it to the result array
