# You are given an array which contains only integers (positive and negative). 
# Your job is to sum only the numbers that are the same and consecutive. The result should be one array.
# You can asume there is never an empty array and there will always be an integer.

def sum_consecutives(array)
  results = []
  num_arr = array.dup
  results << array[0]

  (1..array.size - 1).each do |index|
    if array[index] == num_arr[index - 1]
      results[- 1] += array[index]
    else
      results << array[index]
    end
  end
  results
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
