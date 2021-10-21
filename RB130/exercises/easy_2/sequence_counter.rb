# The Range#step method lets you iterate over a range of values where each value in the iteration is the
# previous value plus a "step" value. It returns the original range.

# Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your
# method should take 3 arguments: the starting value, the ending value, and the step value to be applied
# to each iteration. Your method should also take a block to which it will yield (or call) successive
# iteration values.

# Example:
# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10


def step(first, last, step_value)
  current_value = first
  while current_value <= last
    yield(current_value)
    current_value += step_value
  end
  current_value
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# option 2
def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end

# option 3: using the Numeric#step method
def step(start, stop, step)
  start.step(by:step, to:stop) {|e| yield(e) }
end
