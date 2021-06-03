# Write a function named xor that takes two arguments
# have it return true is exactly one it's arguments is truthy, false otherwise
# looking for a boolean result

def xor?(exp1, exp2)
  if (exp1 == true && exp2 == false) || \
      (exp2 == true && exp1 == false)
      return true
  end
end

# could also be:

# def xor?(value1, value2)
#   return true if value1 && !value2
#   return true if value2 && !value1
#   false
# end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
