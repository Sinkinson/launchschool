# return an array which contains only the hashes where all the integers are even

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.select do |hash|
  hash.all? do |_,value|
    value.all? do |num|
      num.even?
    end
  end
end

p arr2

# if all integers in the inner array are even the block returns true to the innermost all?
# if all the inner blocks for a particular hash return true then the middle block returns true
# to the outer call to all? which in turn causes the outer block to return true to select
