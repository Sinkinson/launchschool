# what is the return value of the select method below. Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => ['1', '2', '3']
# select performs selection based on the truthiness of the blocks return value
# in this case the return value will always be 'hi' which is truthy
# therefore select will return a new array containing all the elements in the 
# original array
