# How can we add multiple items to this array, such as "Dino" and "Hoppy"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# option 1
flintstones.push("Dino", "Hoppy")

# option 2
# push returns the array so we can chain
flintstones.push("Dino").push("Hoppy")   

# option 3
# concat adds an array rather than one item
flintstones.concat(%w(Dino Hoppy))
