# Given an integer as input, can you round it to the next (meaning, "higher") multiple of 5?

def round_to_next_5(n)
  return n if n % 5 == 0
  multiplier = (n / 5)
  5 * (multiplier + 1)
end

# Examples
# input:    output:
# 0    ->   0
# 2    ->   5
# 3    ->   5
# 12   ->   15
# 21   ->   25
# 30   ->   30
# -2   ->   0
# -5   ->   -5

# refactor

def round_to_next_5(n)
  n % 5 == 0 ? n : ((n / 5) + 1) * 5
end
