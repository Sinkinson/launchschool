# Write a method named include? that takes an array and a search value as arguments.
# This method should return true if the search value is in the array, false if it is not.
# You cannot use the Array#include? method in your solution

def include?(array, value)
  !!array.find_index(value)
end

# the find_index method returns the index number of
# the found element, which will always be a truthy value
# or nil if no such element is present.
# the !! is then used to force the statement to return a boolean

# the each method can also be used

def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

# we can also find the solution using a hash

def include?(array, search_value)
  int_hash = Hash.new(0)
  int_hash[search_value] = 1
  array.each do |int|
    int_hash[int] += 1
  end
int_hash[search_value] == 2 # this will return a true or false boolean alone
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
