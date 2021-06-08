number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end

# iterating over a hash using a loop takes a few more steps
# we create an array containing all the keys in the hash
# we can then use the new array of keys to iterate over the hash
# this is a two step process: first, we iterate over the array of
# keys (pets) and save each key into the current_pet variable.
# Then we use the current pet key to retrieve the appropriate value
# out of the number_of_pets hash.
# the puts statement interpolates both the current hash value and
# the current hash key into a string
