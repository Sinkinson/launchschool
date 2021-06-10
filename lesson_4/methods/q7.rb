# 1. What is the blocks return value in the following code? How is it determined?
# 2. What is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# any? returns true if any element of self meet a certain criterion

# 1. The return value of the block is determined by the last expression
#    in the block. last expression is num.odd?, which returns a boolean.
#    Therefore, the block returns true.
# 2. Because the first iteration returns true, any? returns true and therefore
#    does not need to keep iterating, so number 1 is the only number printed
