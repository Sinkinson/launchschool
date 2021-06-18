# Given an unordered array and the information that exactly one value in the array
# occurs twice (every other value occurs exactly once).
# How would you determine which value occurs twice?
# Write a method that will find and return the duplicate value that is known to be in
# the array

def find_dup(array)
  dup_hash = Hash.new(0)
  array.each { |integer| dup_hash[integer] += 1 }
  dup_hash.key(2) # returns the key which has a value of 2
end

# test cases
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# LS way

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

# uses find to look through each item in the array
# if that item meets the condition it is returned
# the count method counts the value given in parentheses

# same method but using an array

def find_dup(array)
  new_array = []
  array.each do |element|
    return element if new_array.include?(element)
    new_array << element
  end
end
