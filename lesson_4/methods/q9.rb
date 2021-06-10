# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => =['nil', 'bear']
# map returns a new array. So here we are returning the value
# if the value size is over 3. But where does the 'nil' come from?
# When 'ant' is checked against the if condition it evaluates to
# false and value isn't returned. But when none of the conditions
# in an if statement evaluate as true, the if statement itself
# returns 'nil'. This is why we see 'nil' as the first element in
# the returned array
