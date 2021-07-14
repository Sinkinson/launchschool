# Given an array of integers, find the minimum sum which is obtained from summing each two integers product.
# array will contain positive integers only and will always be of even size

def min_sum(array)
  array.sort!
  total = 0
  return 0 if array.empty?
  loop do
    first_num = array.shift
    last_num = array.pop
    total += (first_num * last_num)
    break if array.empty?
  end
  total
end

#Test cases
p min_sum([5,4,2,3]) # ==> return (22)
p min_sum([12,6,10,26,3,24]) # ==> return (342)
p min_sum([9,2,8,7,5,4,0,6]) # ==> return (74)

# more concise solution using map

def min_sum(arr)
  arr.sort!
  (0...arr.size / 2).map { |num| arr[num] * arr[-num - 1] }.sum
end
