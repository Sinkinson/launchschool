# find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# so we need to iterate through the word array and find with name
# starts with "Be" and then return the index if it does start with "Be"

flintstones.each do |name|
  flintstones.index(name) if name.start_with?("Be")
end

# could also just use index method

flintstones.index { |name| name[0, 2] == "Be" }

# we get access to the element using index. name[0, 2] says
# that if starting at index 0 and 2 characters from index 0
# == "Be" then return the index value
