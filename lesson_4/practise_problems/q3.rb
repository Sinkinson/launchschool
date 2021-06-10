# remove people with age 100 or greater

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if do |_, value|
  value > 100
end

# could also use keep_if

# ages.keep_if { |_, age| age < 100 }
