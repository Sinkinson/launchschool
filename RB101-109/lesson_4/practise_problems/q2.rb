# add up all the ages of the Munster family hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_of_ages = ages.values.inject(:+) # => 6174

# could also set a variable to zero first and then use the each method

# total_ages = 0
# ages.each { |_, age| total_ages += ages }
# total_ages

# remember when underscore it used as a argument its beacuse you simply
# don't want to use that element.