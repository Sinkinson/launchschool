# In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return
# the lowest number possible, without changing the order of the digits in n. Return the result as a string.

# Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible
# number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

# Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed
# 8 and 9.

def solve(n, k)
  n.to_s.chars.combination(n.to_s.size - k).map(&:join).min_by(&:to_i)
end

p solve(123056,1)
p solve(123056,3)
