# Given a number, return the maximum number that could be formed from the digits of the number given

def max_number(n)
  n.digits.sort { |a, b| b <=> a }.join.to_i
end

# Test cases
max_number(213)
max_number(7389)
max_number(63792)
max_number(566797)
max_number(1000000)

# Could also use reverse method if sorted into ascending order first
def max_number(n)
  n.digits.sort.reverse.join.to_i
end
