# Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way
# until a single-digit number is produced. The input will be a non-negative integer.

def digital_root(n)
  n < 10 ? n : digital_root(n.to_s.chars.map(&:to_i).sum)
end

p digital_root(16) #== 7
p digital_root(942) #== 6
p digital_root(132189) #== 6
p digital_root(493193) #== 2

# without using recursion
def digital_root(n)
  total = n.digits.sum
  until total < 10
    total = total.digits.sum
  end
  total
end
