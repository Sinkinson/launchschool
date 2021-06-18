# order this array of number strings by descending value

arr = ['10', '11', '9', '7', '8']

p arr.sort { |a, b| b.to_i <=> a.to_i }
