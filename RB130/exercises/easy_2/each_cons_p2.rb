# In the previous exercise, we wrote a method that emulates Enumerable#each_cons, but limited our method to handling 2
# elements at a time. Enumerable#each_cons can actually handle any number of elements at a time: 1, 2, 3, or more.

# Update your each_cons method so it takes an argument that specifies how many elements should be processed at a time.

# Your method may use #each, #each_index, #each_with_object, #inject, loop, for, while, or until to iterate through the
# Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

def each_cons(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index, n])
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}

# option 2
def each_cons(arr, n)
  arr[0..-n].each_index { |i| yield(*arr[i, n]) }
  nil
end

# This solution breaks the array down straight away by using the argument to only iterate to the correct end-point element.
# Say we have an array, [1,2,3,4], and our argument size is 2. Then the end-point element would be 3 because when we take 2
# elements starting at 3 we get the last element and no more. We don't want to iterate past 3 because then we will get a nil value
# if we take two elements starting at 4.
