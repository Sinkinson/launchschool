# Turn the following hash into an array containing only barneys name and number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# with the assoc method. If key found, returns a 
# 2 element array with key and value.

flintstones.assoc("Barney")
#=> ["Barney", 2]

# without the assoc method

flintstones.delete_if do |name, num|
  name != "Barney"
end
flintstones.to_a.flatten!
#=> ["Barney", 2]
