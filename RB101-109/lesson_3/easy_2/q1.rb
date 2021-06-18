# see if spot is present in the following hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# option 1
ages.has_key?("Spot")

# aliases for the above
ages.key?("Spot")
ages.include?("Spot")
