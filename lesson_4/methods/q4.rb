# what is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# hash['ant'[0]] = value
# 'ant'[0] is extracting 'a'
# we are doing hash assignment so 'a' is the key
# and then we are equalling it to the value

# so we are saying 'a' => 'ant' within the hash
# we do this for every word therefore we have the first
# letter of every word as the key and the full word as the
# value in our hash

# => { "a" => "ant", "b" => "bear", "c" => "cat" }

# remember where each and each_with_object differ is that each_with_object
# returns the object at the end of the iteration, so in the case above the hash
# whereas the each method returns the original collection it was called upon
