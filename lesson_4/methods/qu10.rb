# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, 'nil', 'nil']
# For the first iteration, the if condition evaluates to false
# so the number is returned for that iteration.
# For the rest of the numbers, if evaluates to true. Therefore,
# 'puts num' is the last evaluated statement which means the block
# returns 'nil' for those iterations
