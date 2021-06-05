# write a method that takes an array of numbers
# it returns an array with the same number of elements
# and each element has the running total from the original array

def running_total(arr)
  new_arr = []
  sum = 0
  arr.each do |num|
    sum += num
    new_arr << sum
  end
  new_arr
end

# more concise method of the above, just use the map method

# def running_total(arr)
#   sum = 0
#   array.map { |num| sum += num }
# end

# test cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# if you were using the each_with_object method

def running_total(arr)
  arr.each_with_object([]) do |value, array|
    if array.empty?
      array << value
    else
      array << value + array.last
    end
  end
end
