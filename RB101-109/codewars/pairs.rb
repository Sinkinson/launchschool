# You are given array of integers, your task will be to count all pairs in that array and return their count.
# Array can be empty or contain only one value, in this case return 0
# if there are more pairs of a certin number, count each pair only once e.g. for [0,0,0,0] the return value is 2

def pairs(arr)
  holding_arr = []
  pair_count = 0
  pairs_arr = arr.select { |num| arr.count(num) >= 2 }
  pairs_arr.each do |num|
    pair_count += pairs_arr.count(num) / 2 unless holding_arr.include?(num)
    holding_arr << num
  end
  pair_count
end

p pairs([1, 2, 5, 6, 5, 2])
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
p pairs([0, 0, 0, 0, 0, 0, 0])
p pairs([1000, 1000])
p pairs([])
p pairs([54])

# concise solution using uniq and map

def pairs(arr)
  arr.uniq.map { |x| arr.count(x) / 2 }.sum
end

# first use uniq on the arr to get rid of any duplicate values, the map method is then called on this array with no
# duplicates. Within the block the return value of counting the current value in the original array divided by 2 is
# returned. The sum method is then called on the array returned by map to add up all the pairs
