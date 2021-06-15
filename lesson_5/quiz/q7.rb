[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
  sub_arr.map do |letter|
    letter.upcase
  end
end

# The return value of the String#upcase method is returned by the inner block to the inner 
# call to Array#map; this adds the uppercase string to a new array in place of the lowercase 
# version. This new array is returned by the outer block to the outer call to Array#map. This 
# call to map also creates a new array, populated by the new inner arrays 
# (containing the uppercase strings), which it then returns.
