# create a hash that expresses the frequency with which each letter
# occurs in the string

# expected output: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"

string_arr = statement.chars
string_arr.delete(" ")
occurences_of_letter = Hash.new(0)

string_arr.each do |char|
  occurences_of_letter[char] += 1
end

p occurences_of_letter

# line 13 is the same as saying occurences_of_letter[char] = occurences_of_letter[char] + 1
# we are basically saying that everytime we have the same character plus one to its value
# as "occurences_of_letter[char] =" is assignment of the value within the hash

# LS way

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# here we create one large array with the alphabet in upper and lowercase
# then we iterate through the letters
# we set a variable called letter_frequency and equal it to how many times
# the letter shows up in the word
# When scan finds a letter in the alphabet it returns an array with all the 
# occurences of that letter, which we then use count on the array to find the total
# we then set the key and value in the results hash with this information 
# but avoid spaces by setting an if condition
