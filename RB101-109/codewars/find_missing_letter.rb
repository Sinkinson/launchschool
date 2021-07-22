# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
# The array will always contain letters in only one case.

# Example:

# ['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'

def find_missing_letter(arr)
  ascii_nums = arr.map(&:ord)
  ascii_nums.each_with_index do |num, idx|
    next if num + 1 == ascii_nums[idx + 1]
    return (num + 1).chr
  end
end

p find_missing_letter(["a","b","c","d","f"])

# option 2
def find_missing_letter(arr)
  ((arr.first..arr.last).to_a - arr).first
end
